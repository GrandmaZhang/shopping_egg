'use strict';

const Controller = require('egg').Controller;

class AdminController extends Controller {
  async getAllItems() {
    const { ctx } = this;
    const { table, params } = ctx.query;
    try {
      const result = await ctx.service.admin.getAllItems(table, params);
      ctx.body = {
        code: 1,
        success: true,
        data: result,
      };
    } catch (err) {
      ctx.body = {
        code: -2,
        success: false,
        msg: '获取数据失败',
      };
    }
  }
}

module.exports = AdminController;
