import { Roboto } from "next/font/google";
import { Button } from "@/components/ui/button";
import { cn } from "@/lib/utils";
import { LoginButton } from "@/components/auth/login-button";

const font = Roboto({
  subsets: ["latin"],
  weight: ["700"],
});

export default async function Home() {
  return (
    <main className="flex h-full flex-col items-center justify-center bg-[radial-gradient(ellipse_at_top,_var(--tw-gradient-stops))] from-[#f86006] to-orange-900">
      <div className="space-y-6 text-center">
        <h1
          className={cn(
            "text-6xl font-semibold drop-shadow-md",
            font.className
          )}
        >
          🔐 Auth
        </h1>
        <p className="text-lg">A simple authentication service</p>
        <div>
          <LoginButton>
            <Button size="lg">Sign in</Button>
          </LoginButton>
        </div>
      </div>
    </main>
  );
}

// bg-[#f86006]
