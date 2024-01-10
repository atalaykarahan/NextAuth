"use client";
import { logout as authLogout } from "@/actions/logout";
import { logout as axiosLogout } from "@/app/_api/services/authService";
import { useCurrentUser } from "@/hooks/use-current-user";
import { useSession, signOut } from "next-auth/react";

const SettingsPage = () => {
  const user = useCurrentUser();

  const onClick = () => {
    axiosLogout().then((res: any) => {
      if (res.status === 200) {
        authLogout();
      }
    });
  };

  return (
    <div className="bg-white p-10 rounded-xl">
      <button onClick={onClick} type="submit">
        sign out
      </button>
    </div>
  );
};

export default SettingsPage;
