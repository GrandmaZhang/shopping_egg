"use strict";

const Service = require("egg").Service;
class UserService extends Service {
  async getList() {
    const { app } = this;
    const users = await app.mysql.get("user");
    return users;
  }
  async getUser(username) {
    const { app } = this;
    const user = await app.mysql.get("user", { username });
    return user;
  }
  async getUserById(id) {
    const { app } = this;
    const user = await app.mysql.get("user", { id });
    return user;
  }
  async updateMoneyAndShoppingCart(userId, price, orderId) {
    const { app } = this;
    const userInfo = await app.mysql.select("user", { where: { id: userId } });
    if (userInfo.length) {
      let orderIds = userInfo[0].orderIds && JSON.parse(userInfo[0].orderIds);
      if (orderIds) {
        orderIds.push(orderId);
      } else {
        orderIds = [orderId];
      }
      // const row = { ...userInfo[0], money: parseFloat(userInfo[0].money - price), orderIds: JSON.stringify(orderIds) };
      const row = {
        ...userInfo[0],
        money: userInfo[0].money,
        orderIds: JSON.stringify(orderIds)
      };
      const result = await app.mysql.update("user", row);
      return result;
    }
    return null;
  }
}

module.exports = UserService;
