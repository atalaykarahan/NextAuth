import { LoginDto } from "@/app/_models/DTOs/loginDto";
import { RegisterDto } from "@/app/_models/DTOs/registerDto";
import axios from "../axios";

export const getLoggedInUser = () => {
  return axios.get(`users/`);
};

export const login = (user: LoginDto) => {
  return axios.post(`users/login`, user);
};

export const logout = () => {
  return axios.post(`users/logout`);
};

export const signUp = (user: RegisterDto) => {
  return axios.post(`users/signup`, user);
};
