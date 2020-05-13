"use strict";

const Controller = require("egg").Controller;

class OrderController extends Controller {
  async getOrdersByUserId() {
    const { ctx } = this;
    const { id } = ctx.query;
    try {
      const orders = await ctx.service.order.getOrdersByUserId(id);
      ctx.body = {
        code: 0,
        success: true,
        data: orders
      };
    } catch (err) {
      ctx.body = {
        code: -2,
        success: false,
        msg: "获取订单失败"
      };
    }
  }
  async addOrder() {
    const { ctx } = this;
    const { userId, goods, price } = ctx.request.body;
    try {
      // 在这里需要把物品各个数据分插到各个商家
      const order = await ctx.service.order.addOrder(userId, goods);
      await ctx.service.user.updateMoneyAndShoppingCart(
        userId,
        price,
        order.insertId
      );
      await ctx.service.goods.clearCartItem(userId);
      ctx.body = {
        code: 0,
        success: true,
        data: true
      };
    } catch (err) {
      console.log(err);
      ctx.body = {
        code: -2,
        success: false,
        msg: "新增订单失败"
      };
    }
  }
  async cancelOrder() {
    const { ctx } = this;
    const { id, order, status } = ctx.request.body;

    try {
      await ctx.service.order.cancelOrder(id, order, status);
      ctx.body = {
        code: 0,
        success: true,
        data: true
      };
      this.ctx.socket.emit("res", "hihihihihi");
    } catch (err) {
      ctx.body = {
        code: -2,
        success: false,
        msg: "取消订单失败"
      };
    }
  }

  async changeOrderStatus() {
    const { ctx, app } = this;
    const { id, order, status } = ctx.request.body;

    const nsp = app.io.of("/");
    // const message = ctx.args[0] || {};
    // const socket = ctx.socket;
    // const client = socket.id;

    try {
      await ctx.service.order.cancelOrder(id, order, status);
      ctx.body = {
        code: 0,
        success: true,
        data: true
      };

      const message = `status=${status}`;
      try {
        // await ctx.socket.emit("news", `Hi! I've got your message: ${message}`);
        // console.log("success!!!");
        // nsp.emit("http://192.168.31.60:8080", "message!!!!!");
        this.ctx.socket.emit("res", "hihihihihi");
      } catch (e) {
        console.log(e);
      }
      console.log(message, "message");
    } catch (err) {
      console.log(err);
      ctx.body = {
        code: -2,
        success: false,
        msg: "取消订单失败"
      };
    }
  }

  // async changeOrderWs() {
  //   const { ctx, app } = this;
  //   const { id, order, status } = ctx.request.body;
  //   try {
  //     const message = `status=${status}`;
  //     await ctx.socket.emit("res", `Hi! I've got your message: ${message}`);
  //     console.log(message, "message");
  //   } catch (err) {
  //     console.log(err);
  //     ctx.body = {
  //       code: -2,
  //       success: false,
  //       msg: "订单状态更新失败"
  //     };
  //   }
  // }

  async deleteOrder() {
    const { ctx } = this;
    const { id } = ctx.request.body;
    try {
      await ctx.service.order.deleteOrder(id);
      ctx.body = {
        code: 0,
        success: true,
        data: true
      };
    } catch (err) {
      ctx.body = {
        code: -2,
        success: false,
        msg: "取消订单失败"
      };
    }
  }
}

module.exports = OrderController;
