"use server"

import prisma from "@/lib/prisma"

export async function getStudentData(){
    try {
        const studentProfile = await prisma.user.findFirst({
            where:{
                id: '1',
                role: 'STUDENT',
            },
            include:{
                studentProfile: true,
            }
        })

        return studentProfile;
    } catch (error) {
        // console.log(error)
        return [];
    }
}