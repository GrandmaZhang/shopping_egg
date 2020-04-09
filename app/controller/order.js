'use strict';

const Controller = require('egg').Controller;

class OrderController extends Controller {
  async getOrdersByUserId() {
    const { ctx } = this;
    const { id } = ctx.query;
    try {
      const orders = await ctx.service.order.getOrdersByUserId(id);
      ctx.body = {
        code: 0,
        success: true,
        data: orders,
      };
    } catch (err) {
      ctx.body = {
        code: -2,
        success: false,
        msg: '获取订单失败',
      };
    }
  }
  async addOrder() {
    const { ctx } = this;
    const { userId, goods, price } = ctx.request.body;
    try {
      // 在这里需要把物品各个数据分插到各个商家
      const order = await ctx.service.order.addOrder(userId, goods);
      await ctx.service.user.updateMoneyAndShoppingCart(userId, price, order.insertId);
      await ctx.service.goods.deleteCartItem(userId);
      ctx.body = {
        code: 0,
        success: true,
        data: true,
      };
    } catch (err) {
      ctx.body = {
        code: -2,
        success: false,
        msg: '新增订单失败',
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
        data: true,
      };
    } catch (err) {
      ctx.body = {
        code: -2,
        success: false,
        msg: '取消订单失败',
      };
    }
  }
  async deleteOrder() {
    const { ctx } = this;
    const { id } = ctx.request.body;
    try {
      await ctx.service.order.deleteOrder(id);
      ctx.body = {
        code: 0,
        success: true,
        data: true,
      };
    } catch (err) {
      ctx.body = {
        code: -2,
        success: false,
        msg: '取消订单失败',
      };
    }
  }
}

module.exports = OrderController;
