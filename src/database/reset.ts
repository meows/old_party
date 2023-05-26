import { Client } from "https://deno.land/x/postgres/mod.ts"
import { load } from "https://deno.land/std@0.189.0/dotenv/mod.ts"

// —————————————————————————————————————————————————————————————————————————————
// Environment

interface env {
   PSQL_USER: string
   PSQL_PASS: string
   PSQL_HOST: string
   PSQL_PORT: string
   PSQL_DB: string

   DATABASE_URL: string
}

const file = "./schema.sql"
const config = await load()

const sql = Deno.readTextFileSync(file)
const client = new Client({
   user: config.PSQL_USER,
   password: config.PSQL_PASS,
   database: config.PSQL_DB,
})

// —————————————————————————————————————————————————————————————————————————————
// Initialize database

await client.connect()
const result = await client
   .queryObject(sql)
   .catch(console.log)

console.log(result)
