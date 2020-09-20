"use strict";

const Service = require("egg").Service;
const crypto = require("crypto");
class RegisterService extends Service {
  async register(params) {
    const { app } = this;
    const hash = crypto.createHash("sha256");
    params.password = hash.update(params.password).digest("hex");
    try {
      const newUser = await app.mysql.insert("user", { ...params });

      return newUser;
    } catch (err) {
      console.log(err);
    }
  }
  async login(params) {
    const { app } = this;
    const hash = crypto.createHash("sha256");
    params.password = hash.update(params.password).digest("hex");
    const user = await app.mysql.get("user", { ...params });
    return user;
  }
}

module.exports = RegisterService;
