"use strict";

const Service = require("egg").Service;
class GoodsService extends Service {
  async getRandomGoods(number) {
    const { app } = this;
    const randomGoods = await app.mysql.query(
      "select * from goods where isDeleted = ? order by rand() limit 0, ?",
      [0, number]
    );
    return randomGoods;
  }
  async getBanner() {
    const { app } = this;
    const banner = await app.mysql.select("banners");
    return banner;
  }
  async getGoodsCategory() {
    const { app } = this;
    const categories = await app.mysql.select("good_category");
    return categories;
  }
  async getGoodsItems(categoryId) {
    const { app } = this;
    const items = await app.mysql.select("goods", {
      where: { categoryId, isDeleted: 0 }
    });
    return items;
  }
  async addGoodsCart(goodsId, number = 1, userId) {
    const { app } = this;
    const item = await app.mysql.select("shopping_cart", {
      where: { goodsId }
    });
    if (Number(number) === 0) {
      await app.mysql.delete("shopping_cart", { goodsId });
      return true;
    }
    if (item.length) {
      const row = { ...item[0], goodsNumber: number };
      await app.mysql.update("shopping_cart", row);
    } else {
      await app.mysql.insert("shopping_cart", {
        goodsId,
        goodsNumber: number,
        createTime: new Date(),
        userId
      });
    }
    return true;
  }
  async getSearchGoods(keyword) {
    const { app } = this;
    const searchResult = await app.mysql.query(
      "select * from goods where isDeleted = 0 and name like ?",
      ["%" + keyword + "%"]
    );
    return searchResult;
  }
  async getCartItem(userId) {
    const { app } = this;
    const result = await app.mysql.query(
      "select * from shopping_cart inner join goods on shopping_cart.goodsId = goods.id and shopping_cart.userId = ?",
      [userId]
    );
    return result;
  }
  async clearCartItem(userId) {
    const { app } = this;
    const result = await app.mysql.delete("shopping_cart", { userId });
    return result;
  }
  async deleteCartItem(goodsId) {
    const { app } = this;
    const result = await app.mysql.delete("shopping_cart", { goodsId });
    return result;
  }
  async addGoods(row) {
    const { app } = this;
    const result = await app.mysql.insert("goods", { ...row });
    return result;
  }
  async deleteGoods(id) {
    const { app } = this;
    const result = await app.mysql.delete("goods", { id });
    return result;
  }
  async getGoodsById(id) {
    const { app } = this;
    const result = await app.mysql.select("goods", {
      where: { id }
    });
    return result;
  }
}

module.exports = GoodsService;
