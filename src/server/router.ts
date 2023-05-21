import type { inferAsyncReturnType } from "@trpc/server"

import { z } from "zod"
import { initTRPC, TRPCError } from "@trpc/server"

// —————————————————————————————————————————————————————————————————————————————
// Environment

export type Context = inferAsyncReturnType<typeof createContext>
export type AppRouter = typeof router

const t = initTRPC.context<Context>().create()

export async function createContext(event: APIEvent) {
   const { user, token } = getCookies(event.request.headers.get("Cookie"))
   const body = event.request.json().catch(() => ({}))
   return {
      user: user ?? "",
      token: token ?? "",
      body,
   }
}

// —————————————————————————————————————————————————————————————————————————————
// Routes

export const router = t.router({

})