import * as z from "zod";

export const LoginSchema = z.object({
    nick_name: z.string({
        invalid_type_error:"Geçersiz karakter"
    }),
    password: z.string().min(1,{
        message:"Şifre girmediniz."
    }),
});