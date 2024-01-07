"use client";
import * as z from "zod";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { LoginSchema } from "@/schemas";
import { Input } from "@/components/ui/input";
import { login } from "@/app/_api/services/authService";
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form";
import { CardWrapper } from "./card-wrapper";
import { Button } from "../ui/button";
import FormError from "../form-error";
import FormSuccess from "../form-success";
import { LoginDto } from "@/app/_models/DTOs/loginDto";
import { useState, useTransition } from "react";

export const LoginForm = () => {
  const [isPending, startTransition] = useTransition();
  const [errorMessage, setErrorMessage] = useState("");
  const form = useForm<z.infer<typeof LoginSchema>>({
    resolver: zodResolver(LoginSchema),
    defaultValues: {
      nick_name: "",
      password: "",
    },
  });

  const onSubmit = (values: z.infer<typeof LoginSchema>) => {
    const serverProps: LoginDto = {
      user_name: values.nick_name,
      password: values.password,
    };

    startTransition(() => {
      try {
        login(serverProps)
          .then((res: any) => {
            if (!res.status) {
              throw new Error("User ile ilgili bir hata oluştu");
            }
            return res.data;
          })
          .then((response: any) => {
            console.log(response);
          })
          .catch((err: any) => {
            if (err.response.status) {
              setErrorMessage("Geçersiz kullanıcı bilgileri");
              console.log("düştü");
            }
            console.log(err);
          });
      } catch (error) {
        console.log("kullanıcı ile ilgili bir sorun oluştu ", error);
      }
    });

    console.log(serverProps);
  };

  return (
    <CardWrapper
      headerLabel="Welcome back"
      backButtonLabel="Don't have an account?"
      backButtonHref="/auth/register"
      showSocial
    >
      <Form {...form}>
        <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-6">
          <div className="space-y-4">
            <FormField
              control={form.control}
              name="nick_name"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Kullanıcı Adı</FormLabel>
                  <FormControl>
                    <Input
                      {...field}
                      placeholder="krhnatalay"
                      type="text"
                      disabled={isPending}
                    />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />
            <FormField
              control={form.control}
              name="password"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Şifre</FormLabel>
                  <FormControl>
                    <Input
                      disabled={isPending}
                      {...field}
                      placeholder="********"
                      type="password"
                    />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />
          </div>
          <FormError message={errorMessage} />
          <FormSuccess message="" />
          <Button type="submit" className="w-full">
            Giriş Yap
          </Button>
        </form>
      </Form>
    </CardWrapper>
  );
};
