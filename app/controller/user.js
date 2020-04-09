'use strict';

const Controller = require('egg').Controller;

class UserController extends Controller {
  async getUserList() {
    const { ctx } = this;
    const userList = await ctx.service.user.getList();
    ctx.body = userList;
    return userList;
  }
  async getUserInfo() {
    const { ctx } = this;
    const userCookie = ctx.cookies.get('login', { encrypt: true });
    if (!userCookie) {
      ctx.body = { code: -1, msg: '未登录' };
    } else {
      try {
        const { id } = JSON.parse(userCookie);
        const userInfo = await ctx.service.user.getUserById(id);
        ctx.body = userInfo;
      } catch (err) {
        ctx.body = { code: -1, msg: '未登录' };
      }
    }
  }
  async updateMoney(userId, price) {
    const { ctx } = this;
    const result = await ctx.service.user.updateMoney(userId, price);
    return result;
  }
}

module.exports = UserController;
