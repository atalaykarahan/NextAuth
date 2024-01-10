"use server";

import { signOut } from "@/auth";
import { cookies } from "next/dist/client/components/headers";

export const logout = async () => {
    /*if you wanna do some server stuff you can using 
    like this logout method */
    cookies().delete('connect.sid')
    await signOut();
}





// you can paste if you want to use settings page on server side 
// import { auth, signOut } from "@/auth";

// const SettingsPage = async () => {
//   const session = await auth();

//   return (
//     <div>
//       {JSON.stringify(session)}

//       <form
//         action={async () => {
//           "use server";

//           await signOut();
//         }}
//       >
//         <button type="submit">sign out</button>
//       </form>
//     </div>
//   );
// };

// export default SettingsPage;
