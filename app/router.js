"use strict";

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller, io } = app;
  router.get("/", controller.home.index);
  router.get("/user", controller.user.getUserList);
  router.get("/userInfo", controller.user.getUserInfo);
  router.post("/register", controller.register.register);
  router.post("/login", controller.register.login);
  router.get("/recommend-goods", controller.goods.getRecommendGoods);
  router.get("/banner", controller.goods.getBanner);
  router.get("/goods-category", controller.goods.getGoodsCategory);
  router.get("/goods-items", controller.goods.getGoodsItems);
  router.get("/add-goods-cart", controller.goods.addGoodsCart);
  router.get("/search-goods", controller.goods.getSearchGoods);
  router.get("/goods/detail", controller.goods.getGoodsById);
  router.get("/get-cart-item", controller.goods.getCartItem);
  router.post("/add-order", controller.order.addOrder);
  router.get("/get-orders", controller.order.getOrdersByUserId);
  router.post("/cancel-order", controller.order.cancelOrder);
  router.get("/get-all-items", controller.admin.getAllItems);
  router.post("/delete-order", controller.order.deleteOrder);
  router.post("/add-goods", controller.goods.addGoods);
  router.post("/delete-goods", controller.goods.deleteGoods);
  router.post("/delete-cart-item", controller.goods.deleteCartItem);

  // app.io.of('/')
  app.io.route("statusChange", app.io.controller.chat.index);

  // app.io.of('/chat')
  app.io
    .of("/statusChange")
    .route("statusChange", app.io.controller.chat.index);

  // // app.io.of('/')
  // app.io.route("buyer", app.io.controller.chat.connectBuyer);

  // // app.io.of('/chat')
  // app.io.of("/buyer").route("buyer", app.io.controller.chat.connectBuyer);
};
