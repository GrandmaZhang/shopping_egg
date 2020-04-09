'use strict';

// 订单状态 0：已完成 1：商家确认中 2：用户确认中 3: 用户发起取消，商家确认取消中 4：已取消
const Service = require('egg').Service;
class AdminService extends Service {
  async getAllItems(table, params = {}) {
    const { app } = this;
    let result;
    if (Object.keys(params).length) {
      result = await app.mysql.select(table, {
        where: { ...JSON.parse(params) },
      });
    } else {
      result = await app.mysql.select(table);
    }
    return result;
  }
}

module.exports = AdminService;
