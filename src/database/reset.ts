import { Client } from "https://deno.land/x/postgres/mod.ts"
import { config } from "https://deno.land/x/dotenv/mod.ts"

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

console.log(JSON.stringify(config()))