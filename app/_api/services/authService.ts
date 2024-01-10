import { LoginDto } from "@/app/_models/DTOs/loginDto";
import { RegisterDto } from "@/app/_models/DTOs/registerDto";
import axios from "../axios";
import { cookies } from "next/dist/client/components/headers";
import { RequestCookie } from "next/dist/compiled/@edge-runtime/cookies";


// Getting cookie for server side request (XmlHttpRequest)
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


// ------------ All server side request (XmlHttpRequest) ------------
export const getLoggedInUserServer = async () => {
  const query = await fetch(`${process.env.BASE_URL}/users`, {
    headers: {
      Cookie: `${getMyCookie()}`,
    },
  });
  const response = await query.json();
  return response;
};


export const signUpServer = async (user:RegisterDto) => {
  const query = await fetch(`${process.env.BASE_URL}/users/signup`, {
    method:'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    credentials: "include",
    body: JSON.stringify(user),
  });
  const cookieFullString = query.headers.get("set-cookie");
  console.log(cookieFullString);
  const response = await query.json();
  return response;
};





// ---------- All client side code ----------
// export const getLoggedInUserClient = () => {
//   return axios.get(`users/`);
// };



export const login = (user: LoginDto) => {
  return axios.post(`/users/login`, user);
};

export const logout = () => {
  return axios.post(`/users/logout`);
};

export const signUp = (user: RegisterDto) => {
  return axios.post(`/users/signup`, user);
};

export const check = (user: LoginDto) => {
  return axios.post(`/users/check`, user);
};
