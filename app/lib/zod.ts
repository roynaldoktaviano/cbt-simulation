import {z} from 'zod';

export const LoginSchema = z.object({
    username : z.string().min(5,"Username harus lebih dari 5 Karakter"),
    password : z.string().min(8,"Password harus lebih dari 8 Karakter"),
})