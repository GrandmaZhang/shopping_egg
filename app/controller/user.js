"use strict";

const Controller = require("egg").Controller;

class UserController extends Controller {
  async getUserList() {
    const { ctx } = this;
    const userList = await ctx.service.user.getList();
    ctx.body = userList;
    return userList;
  }
  async getUserInfo() {
    const { ctx } = this;
    const userCookie = ctx.cookies.get("login", { encrypt: true });
    if (!userCookie) {
      ctx.body = { code: -1, msg: "未登录" };
    } else {
      try {
        const { id } = JSON.parse(userCookie);
        const userInfo = await ctx.service.user.getUserById(id);
        ctx.body = userInfo;
      } catch (err) {
        ctx.body = { code: -1, msg: "未登录" };
      }
    }
  }
  async updateUserInfo() {
    const { ctx } = this;
    const userInfo = ctx.request.body;
    try {
      await ctx.service.user.updateUser(userInfo);
      ctx.body = {
        code: 0,
        msg: "修改成功"
      };
    } catch (err) {
      ctx.body = { code: -1, msg: "个人信息修改失败" };
    }
  }
  async updateMoney(userId, price) {
    const { ctx } = this;
    const result = await ctx.service.user.updateMoney(userId, price);
    return result;
  }
}

module.exports = UserController;
