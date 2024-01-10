import { ExtendedUser } from "@/auth";
import { Card, CardHeader, CardContent } from "./ui/card";

interface UserInfoProps {
  user?: ExtendedUser;
  label: string;
}


export const UserInfo = ({ user, label }: UserInfoProps) => {
    console.log(user);
    return (
    <Card className="w-[600px] shadow-md">
      <CardHeader>
        <p className="text-2xl font-semibold text-center">{label}</p>
      </CardHeader>
      <CardContent className="space-y-4">
        <div className="flex flex-row items-center justify-between rounded-lg border p-3 shadow-sm">
          <p className="text-sm font-medium">ID</p>
          <p>{user?.id ?? "-"}</p>
        </div>
      </CardContent>
    </Card>
  );
};
