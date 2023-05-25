import { z } from "zod"
import { createTRPCRouter, publicProcedure } from "~/server/trpc"

// —————————————————————————————————————————————————————————————————————————————
// Example Router

export const exampleRouter = createTRPCRouter({
   hello: publicProcedure
      .input(z.object({ text: z.string() }))
      .query(({ input }) => {
         return {
            greeting: `Hello ${input.text}`,
         };
      }),
   getAllUsers: publicProcedure.query(({ ctx }) => ctx.prisma.users.findMany()),
})
