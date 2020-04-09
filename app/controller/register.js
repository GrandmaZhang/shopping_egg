'use strict';

const Controller = require('egg').Controller;
class RegisterController extends Controller {
  async register() {
    const { ctx } = this;
    try {
      const newUser = await ctx.service.register.register(ctx.request.body);
      const result = await ctx.service.user.getUserById(newUser.insertId);
      ctx.body = {
        code: 0,
        success: true,
        data: {
          username: result.username,
          id: result.id,
        },
      };
    } catch (err) {
      ctx.body = {
        code: 1,
        success: false,
        msg: '注册失败',
      };
    }
  }
  async login() {
    const { ctx } = this;
    try {
      const user = await ctx.service.register.login(ctx.request.body);
      delete user.password;
      ctx.cookies.set('login', JSON.stringify(user), {
        maxAge: 1000 * 3600,
        signed: true,
        encrypt: true,
      });
      ctx.body = {
        code: 0,
        success: true,
        data: user,
      };
    } catch (err) {
      ctx.body = {
        code: 2,
        success: false,
        msg: '登录失败',
      };
    }
  }
}

module.exports = RegisterController;
