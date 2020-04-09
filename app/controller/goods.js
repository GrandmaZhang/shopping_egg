'use strict';

const Controller = require('egg').Controller;

class GoodsController extends Controller {
  async getRecommendGoods() {
    const { ctx } = this;
    try {
      const number = 6;
      const recommendGoods = await ctx.service.goods.getRandomGoods(number);
      ctx.body = {
        code: 0,
        success: true,
        data: recommendGoods.map(item => {
          return {
            ...item,
            url: JSON.parse(item.url),
          };
        }),
      };
    } catch (err) {
      ctx.body = {
        code: -2,
        success: false,
        msg: '获取推荐商品出错',
      };
    }
  }
  async getBanner() {
    const { ctx } = this;
    try {
      const banner = await ctx.service.goods.getBanner();
      ctx.body = {
        code: 0,
        success: true,
        data: banner.map(item => {
          return {
            ...item,
            url: JSON.parse(item.url),
          };
        }),
      };
    } catch (err) {
      ctx.body = {
        code: -2,
        success: false,
        msg: '获取轮播图失败',
      };
    }
  }
  async getGoodsCategory() {
    const { ctx } = this;
    try {
      const categories = await ctx.service.goods.getGoodsCategory();
      ctx.body = {
        code: 0,
        success: true,
        data: categories,
      };
    } catch (err) {
      ctx.body = {
        code: -2,
        success: false,
        msg: '获取商品种类失败',
      };
    }
  }
  async getGoodsItems() {
    const { ctx } = this;
    const { categoryId } = ctx.query;
    try {
      const goods = await ctx.service.goods.getGoodsItems(categoryId);
      ctx.body = {
        code: 0,
        success: true,
        data: goods.map(item => {
          return {
            ...item,
            url: JSON.parse(item.url),
          };
        }),
      };
    } catch (err) {
      ctx.body = {
        code: -2,
        success: false,
        msg: '获取商品失败',
      };
    }
  }
  async addGoodsCart() {
    const { ctx } = this;
    const { goodsId, number, userId } = ctx.query;
    await ctx.service.goods.addGoodsCart(goodsId, number, userId);
    ctx.body = {
      code: 0,
      success: true,
      data: true,
    };
  }
  async getSearchGoods() {
    const { ctx } = this;
    const { keyword } = ctx.query;
    try {
      const goods = await ctx.service.goods.getSearchGoods(keyword);
      ctx.body = {
        code: 0,
        success: true,
        data: goods.map(item => {
          return {
            ...item,
            url: JSON.parse(item.url),
          };
        }),
      };
    } catch (err) {
      ctx.body = {
        code: -2,
        success: false,
        msg: '获取商品失败',
      };
    }
  }
  async getCartItem() {
    const { ctx } = this;
    const { userId } = ctx.query;
    const result = await ctx.service.goods.getCartItem(userId);
    ctx.body = {
      code: 0,
      success: true,
      data: result.length ? result.map(item => {
        return {
          ...item,
          url: JSON.parse(item.url),
        };
      }) : [],
    };
  }
  async addGoods() {
    const { ctx } = this;
    const row = ctx.request.body;
    try {
      const result = await ctx.service.goods.addGoods(row);
      ctx.body = {
        code: 0,
        success: true,
        data: result,
      };
    } catch (err) {
      ctx.body = {
        code: -2,
        success: false,
        msg: '新增商品失败',
      };
    }
  }
  async deleteGoods() {
    const { ctx } = this;
    const { id } = ctx.request.body;
    try {
      await ctx.service.goods.deleteGoods(id);
      ctx.body = {
        code: 0,
        success: true,
        data: true,
      };
    } catch (err) {
      ctx.body = {
        code: -2,
        success: false,
        msg: '删除商品失败',
      };
    }
  }
}

module.exports = GoodsController;
