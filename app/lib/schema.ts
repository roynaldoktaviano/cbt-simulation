import {z} from 'zod';

export const LoginSchema = z.object({
    mail : z.string().min(1,"Email Wajib Diisi"),
    password : z.string({error: "Password Wajib Diisi"}).min(8,"Password harus lebih dari 8 Karakter"),
})