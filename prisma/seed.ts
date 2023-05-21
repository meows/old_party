import { PrismaClient } from "@prisma/client"
const db = new PrismaClient()

// —————————————————————————————————————————————————————————————————————————————
// Data

const users = [
   {

   }
]

// —————————————————————————————————————————————————————————————————————————————
// Execute Query

async function main() {
   db.users.createMany({
      data: [
         {
            hash: "123",
            email: "123",
            phone: "123",
         }
      ]
   })
}