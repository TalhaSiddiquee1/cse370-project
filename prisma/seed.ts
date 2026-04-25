import { PrismaPg } from "@prisma/adapter-pg";
import { Day, PrismaClient, UserGender } from "@prisma/client";
import { Pool } from "pg";
import {
  announcementsData,
  assignmentsData,
  classesData,
  eventsData,
  examsData,
  lessonsData,
  parentsData,
  resultsData,
  studentsData,
  subjectsData,
  teachersData,
} from "../src/lib/data";

const connectionString = process.env.DATABASE_URL;

if (!connectionString) {
  throw new Error("DATABASE_URL is not set.");
}

const pool = new Pool({ connectionString });
const adapter = new PrismaPg(pool);
const prisma = new PrismaClient({ adapter });

const DAY_CYCLE: Day[] = [
  Day.MONDAY,
  Day.TUESDAY,
  Day.WEDNESDAY,
  Day.THURSDAY,
  Day.FRIDAY,
];

const fallbackDate = new Date("2025-01-01T00:00:00");

function splitName(fullName: string) {
  const parts = fullName.trim().split(/\s+/).filter(Boolean);
  const first = parts[0] ?? "Unknown";
  const rest = parts.slice(1).join(" ");
  return {
    name: first,
    surname: rest || "User",
  };
}

function slugify(text: string) {
  return text
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "_")
    .replace(/^_+|_+$/g, "");
}

function parseDateTime(dateText: string, timeText: string) {
  const parsed = new Date(`${dateText}T${timeText}:00`);
  return Number.isNaN(parsed.getTime()) ? fallbackDate : parsed;
}

function plusHours(base: Date, hours: number) {
  return new Date(base.getTime() + hours * 60 * 60 * 1000);
}

async function main() {
  // Clear existing data so rerunning seed does not fail on unique constraints.
  await prisma.result.deleteMany();
  await prisma.attendance.deleteMany();
  await prisma.exam.deleteMany();
  await prisma.assignment.deleteMany();
  await prisma.lesson.deleteMany();
  await prisma.event.deleteMany();
  await prisma.announcement.deleteMany();
  await prisma.student.deleteMany();
  await prisma.parent.deleteMany();
  await prisma.class.deleteMany();
  await prisma.teacher.deleteMany();
  await prisma.subject.deleteMany();
  await prisma.grade.deleteMany();
  await prisma.admin.deleteMany();

  // ADMIN
  await prisma.admin.create({
    data: {
      id: "admin1",
      username: "admin1",
    },
  });
  await prisma.admin.create({
    data: {
      id: "admin2",
      username: "admin2",
    },
  });

  // GRADE
  const gradeLevels = Array.from(
    new Set([
      ...classesData.map((item) => item.grade),
      ...studentsData.map((item) => item.grade),
    ]),
  ).sort((a, b) => a - b);

  const gradeIdByLevel = new Map<number, number>();
  for (const level of gradeLevels) {
    await prisma.grade.create({
      data: {
        level,
      },
    });
  }

  const createdGrades = await prisma.grade.findMany();
  for (const grade of createdGrades) {
    gradeIdByLevel.set(grade.level, grade.id);
  }

  // SUBJECT
  const subjectNames = Array.from(
    new Set([
      ...subjectsData.map((item) => item.name),
      ...lessonsData.map((item) => item.subject),
      ...examsData.map((item) => item.subject),
      ...assignmentsData.map((item) => item.subject),
      ...resultsData.map((item) => item.subject),
    ]),
  );

  const subjectIdByName = new Map<string, number>();
  for (const name of subjectNames) {
    const created = await prisma.subject.create({ data: { name } });
    subjectIdByName.set(name, created.id);
  }

  // TEACHER
  const teacherIdByName = new Map<string, string>();
  const teacherIds: string[] = [];
  for (let i = 0; i < teachersData.length; i++) {
    const item = teachersData[i];
    const parsedName = splitName(item.name);
    const id = `teacher${item.id}`;

    const created = await prisma.teacher.create({
      data: {
        id,
        username: `teacher_${slugify(item.name)}_${item.id}`,
        name: parsedName.name,
        surname: parsedName.surname,
        email: item.email,
        phone: `8801700${(i + 1).toString().padStart(4, "0")}`,
        address: item.address,
        img: item.photo || null,
        bloodType: i % 2 === 0 ? "A+" : "O+",
        gender: i % 2 === 0 ? UserGender.MALE : UserGender.FEMALE,
        birthday: new Date(1985 + (i % 10), i % 12, (i % 27) + 1),
      },
    });

    teacherIdByName.set(item.name, id);
    teacherIds.push(created.id);
  }

  // CLASS
  const classIdByName = new Map<string, number>();
  const classGradeByName = new Map<string, number>();
  for (const item of classesData) {
    if (classIdByName.has(item.name)) {
      continue;
    }

    const gradeId = gradeIdByLevel.get(item.grade);
    if (!gradeId) {
      continue;
    }

    const created = await prisma.class.create({
      data: {
        name: item.name,
        capacity: item.capacity,
        gradeId,
      },
    });

    classIdByName.set(item.name, created.id);
    classGradeByName.set(item.name, item.grade);
  }

  // Connect class/subject relations for teachers based on teachersData list fields.
  for (let i = 0; i < teachersData.length; i++) {
    const item = teachersData[i];
    const teacherId = teacherIdByName.get(item.name);
    if (!teacherId) {
      continue;
    }

    const classConnections = item.classes
      .map((className) => classIdByName.get(className))
      .filter((id): id is number => typeof id === "number")
      .map((id) => ({ id }));

    const subjectConnections = item.subjects
      .map((subjectName) => subjectIdByName.get(subjectName))
      .filter((id): id is number => typeof id === "number")
      .map((id) => ({ id }));

    await prisma.teacher.update({
      where: { id: teacherId },
      data: {
        classes: classConnections.length
          ? { connect: classConnections }
          : undefined,
        subjects: subjectConnections.length
          ? { connect: subjectConnections }
          : undefined,
      },
    });
  }

  // PARENT
  const parentIds: string[] = [];
  for (let i = 0; i < parentsData.length; i++) {
    const item = parentsData[i];
    const parsedName = splitName(item.name);
    const id = `parent${item.id}`;
    await prisma.parent.create({
      data: {
        id,
        username: `parent_${slugify(item.name)}_${item.id}`,
        name: parsedName.name,
        surname: parsedName.surname,
        email: item.email,
        phone: `8801800${(i + 1).toString().padStart(4, "0")}`,
        address: item.address,
      },
    });
    parentIds.push(id);
  }

  // STUDENT
  const studentIdByName = new Map<string, string>();
  const firstClassId = classIdByName.values().next().value as
    | number
    | undefined;
  const firstGradeId = gradeIdByLevel.values().next().value as
    | number
    | undefined;

  for (let i = 0; i < studentsData.length; i++) {
    const item = studentsData[i];
    const parsedName = splitName(item.name);
    const classId = classIdByName.get(item.class) ?? firstClassId;
    const gradeId =
      gradeIdByLevel.get(item.grade) ??
      gradeIdByLevel.get(classGradeByName.get(item.class) ?? -1) ??
      firstGradeId;

    if (!classId || !gradeId || parentIds.length === 0) {
      continue;
    }

    const parentId = parentIds[i % parentIds.length];
    const id = `student${item.id}`;

    await prisma.student.create({
      data: {
        id,
        username: `student_${slugify(item.name)}_${item.id}`,
        name: parsedName.name,
        surname: parsedName.surname,
        email: item.email,
        phone: `8801900${(i + 1).toString().padStart(4, "0")}`,
        address: item.address,
        img: item.photo || null,
        bloodType: i % 2 === 0 ? "B+" : "O-",
        gender: i % 2 === 0 ? UserGender.MALE : UserGender.FEMALE,
        parentId,
        classId,
        gradeId,
        birthday: new Date(2012 + (i % 5), i % 12, (i % 27) + 1),
      },
    });

    studentIdByName.set(item.name, id);
  }

  // Build class -> teacher fallback map from teacher class preferences.
  const teacherIdByClassName = new Map<string, string>();
  for (const item of teachersData) {
    const teacherId = teacherIdByName.get(item.name);
    if (!teacherId) {
      continue;
    }
    for (const className of item.classes) {
      if (!teacherIdByClassName.has(className)) {
        teacherIdByClassName.set(className, teacherId);
      }
    }
  }

  // LESSON
  const lessonIdBySubjectClass = new Map<string, number>();
  const lessonIds: number[] = [];
  for (let i = 0; i < lessonsData.length; i++) {
    const item = lessonsData[i];
    const subjectId = subjectIdByName.get(item.subject);
    const classId = classIdByName.get(item.class);
    const teacherId =
      teacherIdByName.get(item.teacher) ??
      teacherIdByClassName.get(item.class) ??
      teacherIds[i % teacherIds.length];

    if (!subjectId || !classId || !teacherId) {
      continue;
    }

    const baseStart = parseDateTime("2025-01-06", "08:00");
    const startTime = plusHours(baseStart, i);
    const endTime = plusHours(startTime, 1);

    const created = await prisma.lesson.create({
      data: {
        name: `${item.subject} ${item.class}`,
        day: DAY_CYCLE[i % DAY_CYCLE.length],
        startTime,
        endTime,
        subjectId,
        classId,
        teacherId,
      },
    });

    lessonIdBySubjectClass.set(`${item.subject}|${item.class}`, created.id);
    lessonIds.push(created.id);
  }

  const firstLessonId = lessonIds[0];
  if (!firstLessonId) {
    throw new Error("No lesson records could be created from src/lib/data.ts");
  }

  // EXAM
  const examIds: number[] = [];
  for (const item of examsData) {
    const lessonId =
      lessonIdBySubjectClass.get(`${item.subject}|${item.class}`) ??
      firstLessonId;
    const startTime = parseDateTime(item.date, "10:00");
    const created = await prisma.exam.create({
      data: {
        title: `${item.subject} Exam`,
        startTime,
        endTime: plusHours(startTime, 2),
        lessonId,
      },
    });
    examIds.push(created.id);
  }

  // ASSIGNMENT
  const assignmentIds: number[] = [];
  for (const item of assignmentsData) {
    const lessonId =
      lessonIdBySubjectClass.get(`${item.subject}|${item.class}`) ??
      firstLessonId;
    const dueDate = parseDateTime(item.dueDate, "23:59");
    const created = await prisma.assignment.create({
      data: {
        title: `${item.subject} Assignment`,
        startDate: plusHours(dueDate, -48),
        dueDate,
        lessonId,
      },
    });
    assignmentIds.push(created.id);
  }

  // RESULT
  const firstStudentId = studentIdByName.values().next().value as
    | string
    | undefined;
  for (let i = 0; i < resultsData.length; i++) {
    const item = resultsData[i];
    const studentId = studentIdByName.get(item.student) ?? firstStudentId;
    if (!studentId) {
      continue;
    }

    const isExam = item.type.toLowerCase() === "exam";
    const examId = isExam ? examIds[i % examIds.length] : null;
    const assignmentId = isExam
      ? null
      : assignmentIds[i % assignmentIds.length];

    await prisma.result.create({
      data: {
        score: item.score,
        studentId,
        examId,
        assignmentId,
      },
    });
  }

  // ATTENDANCE
  const studentIds = Array.from(studentIdByName.values());
  const attendanceCount = Math.min(studentIds.length, lessonIds.length);
  for (let i = 0; i < attendanceCount; i++) {
    await prisma.attendance.create({
      data: {
        date: parseDateTime("2025-01-02", "09:00"),
        present: i % 5 !== 0,
        studentId: studentIds[i],
        lessonId: lessonIds[i],
      },
    });
  }

  // EVENT
  for (const item of eventsData) {
    const startTime = parseDateTime(item.date, item.startTime);
    const endTime = parseDateTime(item.date, item.endTime);
    await prisma.event.create({
      data: {
        title: item.title,
        description: `${item.title} for class ${item.class}`,
        startTime,
        endTime,
        classId: classIdByName.get(item.class) ?? null,
      },
    });
  }

  // ANNOUNCEMENT
  for (const item of announcementsData) {
    await prisma.announcement.create({
      data: {
        title: item.title,
        description: `${item.title} announcement`,
        date: parseDateTime(item.date, "09:00"),
        classId: classIdByName.get(item.class) ?? null,
      },
    });
  }

  console.log("Seeding completed successfully.");
}

main()
  .then(async () => {
    await prisma.$disconnect();
    await pool.end();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    await pool.end();
    process.exit(1);
  });
