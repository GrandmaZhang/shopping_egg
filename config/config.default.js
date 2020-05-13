/* eslint valid-jsdoc: "off" */

"use strict";

/**
 * @param {Egg.EggAppInfo} appInfo app info
 */
module.exports = appInfo => {
  /**
   * built-in config
   * @type {Egg.EggAppConfig}
   **/
  const config = (exports = {});

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + "_1576487261720_3684";

  // add your middleware config here
  config.middleware = [];

  // add your user config here
  const userConfig = {
    // myAppName: 'egg',
  };
  const mysql = {
    client: {
      host: "127.0.0.1",
      port: "3306",
      user: "root",
      password: "ML1998ml",
      database: "shopping"
    },
    app: true,
    agent: false
  };
  config.mysql = mysql;
  config.security = {
    csrf: false
  };

  const ws = {
    namespace: {
      "/": {
        connectionMiddleware: [],
        packetMiddleware: [] // 针对消息的处理暂时不实现
      }
    }
  };

  config.io = ws;

  return {
    ...config,
    ...userConfig
  };
};
