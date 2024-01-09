import axios from "axios";
import { cookies } from "next/dist/client/components/headers";

let axiosInstance = axios.create({
  baseURL: process.env.BASE_URL,
  withCredentials: true,
});

try {
  const cStore = cookies();
  const cookees = cStore.get("connect.sid");
  if (cookees) {
    axiosInstance = axios.create({
      baseURL: process.env.BASE_URL,
      withCredentials: true,
      headers: {
        Cookie: `connect.sid=${cookees.value}`,
      },
    });
  }
} catch (error) {
  console.log("kullanıcı henüz giriş yapmadı");
}

export default axiosInstance;
