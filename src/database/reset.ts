import { Client } from "https://deno.land/x/postgres@v0.14.0/mod.ts"
import env from "../../env.json" assert { type: "json" }

// —————————————————————————————————————————————————————————————————————————————
// Environment

const file = "./schema.sql"
const config = {
   user: env.db_user,
   database: env.db_name,
   hostname: "localhost",
   port: 5432,
}

const sql = Deno.readTextFileSync(file)
const client = new Client(config)

// —————————————————————————————————————————————————————————————————————————————
// Initialize database

await client.connect()
const result = await client
   .queryObject(sql)
   .catch(console.log)

console.log(result)
