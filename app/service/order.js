"use strict";

// 订单状态 0：已完成 1：商家确认中 2：用户确认中 3: 用户发起取消，商家确认取消中 4：已取消
const Service = require("egg").Service;
class OrderService extends Service {
  async getOrdersByUserId(id) {
    const { app } = this;
    const result = await app.mysql.select("orders", {
      where: { userId: id }
    });
    return result;
  }
  async addOrder(userId, goods) {
    const { app } = this;
    const result = await app.mysql.insert("orders", {
      status: 1,
      goods: JSON.stringify(goods),
      userId,
      createTime: new Date()
    });
    return result;
  }
  async cancelOrder(id, order, status) {
    const { app } = this;
    const row = { id, ...order, status };
    const result = await app.mysql.update("orders", row);
    return result;
  }

  async deleteOrder(id) {
    const { app } = this;
    const result = await app.mysql.delete("orders", { id });
    return result;
  }
}

module.exports = OrderService;
