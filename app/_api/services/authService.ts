import { LoginDto } from "@/app/_models/DTOs/loginDto";
import { RegisterDto } from "@/app/_models/DTOs/registerDto";
import axios from "../axios";
import { cookies } from "next/dist/client/components/headers";
import { RequestCookie } from "next/dist/compiled/@edge-runtime/cookies";

export const getMyCookie = () => {
  try {
    const cStore = cookies();
    const cookees = cStore.get("connect.sid");
    const readable = cookees?.name +"=" + cookees?.value;
    return readable;
  } catch (error) {
    return { error: "Cookie bulunamadı!" };
  }
};

// export const getLoggedInUser = () => {
//   return axios.get(`users/`);
// };

export const login = (user: LoginDto) => {
  return axios.post(`users/login`, user);
};

export const logout = () => {
  return axios.post(`users/logout`);
};

export const signUp = (user: RegisterDto) => {
  return axios.post(`users/signup`, user);
};

export const check = (user: LoginDto) => {
  return axios.post(`users/check`, user);
};
// For server side request (XmlHttpRequest)
export const getLoggedInUser = async () => {
  const query = await fetch(`${process.env.BASE_URL}users`, {
    headers: {
      Cookie: `${getMyCookie()}`,
    },
  });
  const response = await query.json();
  return response;
};
