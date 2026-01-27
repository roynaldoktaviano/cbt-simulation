import prisma from "@/lib/prisma";
import { PrismaAdapter } from "@lucia-auth/adapter-prisma";
import { Lucia } from "lucia";
import { cookies } from "next/headers";
import { cache } from "react";

const adapter = new PrismaAdapter(prisma.session, prisma.user);

export const lucia = new Lucia(adapter, {
    sessionCookie: {
        expires: false,
        attributes: {
            secure: process.env.NODE_ENV === "production",
        }
    },
    getUserAttributes: (attributes) => {
        return{
            username: attributes.username,
            password: attributes.password,
        }
    }
})

export const getUser = cache(async () => {
    const cookieStore = await cookies();
    const sessionId = cookieStore.get(lucia.sessionCookieName)?.value ?? null;
    
    if(!sessionId) return null;
    const {user, session} = await lucia.validateSession(sessionId);
    try {
        if (session && session.fresh) {
            const sessionCookie = lucia.createSessionCookie(session.id);
            
            cookieStore.set(sessionCookie.name, sessionCookie.value, sessionCookie.attributes);
        }
    } catch {

    }
    return user;
})

declare module "lucia" {
    interface Register {
        Lucia: typeof lucia;
        UserId: string;
        DatabaseUserAttributes : {
            username:string;
            password:string;
        }
    }
} 
