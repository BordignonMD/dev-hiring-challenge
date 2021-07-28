import axios from "axios";

const api = axios.create({
  baseURL: "https://pure-caverns-68092.herokuapp.com/api",
  headers: {'Content-Type' : 'application/x-www-form-urlencoded; charset=UTF-8'}
});

export default api;