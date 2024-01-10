"use client";
import { useRouter } from "next/navigation";

interface LoginButtonProps {
  children: React.ReactNode;
  mode?: "modal" | "redirect";
  asChild?: boolean;
}

// mode = "redirect", ----->  when you want to use default value
export const LoginButton = ({
  children,
  mode = "redirect",
  asChild,
}: LoginButtonProps) => {

    const router = useRouter();


  const onClick = () => {
    console.log("giriş yapma ekranı için butona basıldı");
    router.push("/auth/login");
  };

  if(mode === "modal"){
    return (
        <span>
            bla bla bişeyelr işte 
        </span>
    )
  }

  return (
    <span onClick={onClick} className="cursor-pointer">
      {children}
    </span>
  );
};
