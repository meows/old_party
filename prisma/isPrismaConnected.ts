import { PrismaClient } from "@prisma/client"

const db = new PrismaClient()

async function getAllUsers() {
  return await db.users.findMany()
}

db.$connect()
  .then(getAllUsers)
  .then(console.log)
  .catch(console.error)
  .finally(() => db.$disconnect())