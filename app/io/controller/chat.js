"use strict";

module.exports = app => {
  class Controller extends app.Controller {
    constructor(props) {
      super(props);
      this.buyerIds = [];
    }

    async index() {
      const { ctx, app } = this;
      const message = this.ctx.args[0];
      const socket = ctx.socket;
      const client = socket.id;
      console.log("chat :", message + " : " + process.pid);
      // const say = await this.ctx.service.user.say();

      // 向所有连接sockets广播消息
      app.io.sockets.emit("res", message);

      this.buyerIds.forEach(id => {
        if (app.io.sockets.connected[id]) {
          app.io.sockets.connected[id].emit("change", "change!!!!!!");
        }
      });
    }
    async connectBuyer() {
      const { ctx, app } = this;
      const message = this.ctx.args[0];
      const socket = ctx.socket;
      const client = socket.id;
      this.buyerIds.push(client);
    }
  }
  return Controller;
};
