import { LoginDto } from "@/app/_models/DTOs/loginDto";
import { RegisterDto } from "@/app/_models/DTOs/registerDto";
import axios from "../axios";
import { cookies } from "next/dist/client/components/headers";
import { RequestCookie } from "next/dist/compiled/@edge-runtime/cookies";
import parse, { splitCookiesString } from "set-cookie-parser";


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


//#region All server side request (XmlHttpRequest) start
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
  if(cookieFullString){
    const splittedCookie = splitCookiesString(cookieFullString);
    const myCookie = parse(splittedCookie);

    cookies().set({
      name:myCookie[0].name,
      value:myCookie[0].value,
      expires:myCookie[0].expires,
      httpOnly: myCookie[0].httpOnly,
      path:myCookie[0].path,
    })

  }
  const response = await query.json();
  return response;
};

export const signInServerWithGoole = async (user:RegisterDto) => {
  const query = await fetch(`${process.env.BASE_URL}/users/login/google`, {
    method:'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    credentials: "include",
    body: JSON.stringify(user),
  });
  const cookieFullString = query.headers.get("set-cookie");
  if(cookieFullString){
    const splittedCookie = splitCookiesString(cookieFullString);
    const myCookie = parse(splittedCookie);

    cookies().set({
      name:myCookie[0].name,
      value:myCookie[0].value,
      expires:myCookie[0].expires,
      httpOnly: myCookie[0].httpOnly,
      path:myCookie[0].path,
    })

  }
  const response = await query.json();
  return response;
};

export const logoutServer = async () => {
  const query = await fetch(`${process.env.BASE_URL}/users/logout`, {
    method:'POST',
    headers: {
      Cookie: `${getMyCookie()}`,
    },
  });
  const response = await query.status;
  return response;
}

//#endregion All server side request (XmlHttpRequest) end




//#region  All client side code start

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

//#endregion All client side code end
