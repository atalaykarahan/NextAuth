import NextAuth, { DefaultSession } from "next-auth";
import Credentials from "next-auth/providers/credentials";
import { check, getLoggedInUser } from "./app/_api/services/authService";

import { LoginDto } from "./app/_models/DTOs/loginDto";
import { LoginSchema } from "./schemas";

export type ExtendedUser = DefaultSession["user"] & {
  role: 1 | 2 | 3;
};

declare module "next-auth" {
  interface Session {
    user: ExtendedUser;
  }
}

export const {
  handlers: { GET, POST },
  auth,
  signIn,
  signOut,
} = NextAuth({
  callbacks: {
    async session({ token, session }) {
      console.log({
        sessionToken: token,
      });

      if (token.sub && session.user) {
        session.user.id = token.sub;
      }

      if (token.role && session.user) {
        //auth.js new version is making some error so we fix it like this
        session.user.role = token.role as 1 | 2 | 3;
      }
      return session;
    },
    async jwt({ token }) {
      if (!token.sub) return token;

      const existingUser = await getLoggedInUser();

      //if there is no existing user;
      if (!existingUser) return token;

      token.role = existingUser.authority_id;
      return token;
    },
  },
  session: { strategy: "jwt" },
  providers: [
    Credentials({
      async authorize(credentials) {
        try {
          const user = await getLoggedInUser();
          if (user) {
            return {
              id: user.user_id,
              name: user.user_name,
              email: user.email,
            };
          }
        } catch (error) {
          throw new Error("User authentication error");
        }

        return null;
      },
    }),
  ],
});
