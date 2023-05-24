import { PrismaClient } from "@prisma/client"
const db = new PrismaClient()

// —————————————————————————————————————————————————————————————————————————————
// Data

const users = [
   {
      name: "Meow",
      email: "",
      phone: "",
      hash: "",      
   }
]

// —————————————————————————————————————————————————————————————————————————————
// Execute Query

async function main() {
   db.users.createMany({ data: users })
}