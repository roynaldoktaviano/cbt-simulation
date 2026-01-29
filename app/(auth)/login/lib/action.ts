"use server"

import { LoginSchema } from "@/app/lib/schema";
import { ActionResult } from "@/app/types";
import prisma from "@/lib/prisma";
import { redirect } from "next/navigation";
import bycrpt from 'bcrypt';
import { lucia } from "@/app/lib/auth";
import { cookies } from "next/headers";


export async function LoginAction(
    _:unknown,
    formData: FormData
): Promise<ActionResult> {
    
    const validate = LoginSchema.safeParse({
        mail: formData.get('mail'),
        password: formData.get('password'),
    })

    if(!validate.success) {

        return {
            error: validate.error.issues[0].message
        }
    }

    const existingStudent = await prisma.user.findFirst({
        where:{
            email: validate.data.mail, 
        },
        include:{
            studentProfile: true,
            lecturerProfile: true,
        }
    })

    if (!existingStudent){
        return{
            error:'PENYUSUP! Mahasiswa Belum Terdaftar'
        }
    }

    const validatePassword = bycrpt.compareSync(validate.data.password, existingStudent.password);
    if(!validatePassword){
        return {
            error: 'Password Salah, Besok Lagi ya'
        }
    }

    const session = await lucia.createSession(existingStudent.id, {})
    const sessionCookie = lucia.createSessionCookie(session.id);
    const cookieStore = await cookies();
    cookieStore.set(
        sessionCookie.name,
        sessionCookie.value,
        sessionCookie.attributes
    )

    switch(existingStudent.role){
        case 'ADMIN':
            return redirect('/admin');
        case 'STUDENT':
            return redirect('/dashboard');
        default:
           return redirect('/login');
    }
}

export async function LogoutAction(
    _:unknown,
    formData: FormData
):Promise<ActionResult>{

    console.log('logout action called');
    return redirect('/login');
    
}