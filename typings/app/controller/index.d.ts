// This file is created by egg-ts-helper@1.25.6
// Do not modify this file!!!!!!!!!

import 'egg';
import ExportAdmin = require('../../../app/controller/admin');
import ExportGoods = require('../../../app/controller/goods');
import ExportHome = require('../../../app/controller/home');
import ExportOrder = require('../../../app/controller/order');
import ExportRegister = require('../../../app/controller/register');
import ExportUser = require('../../../app/controller/user');

declare module 'egg' {
  interface IController {
    admin: ExportAdmin;
    goods: ExportGoods;
    home: ExportHome;
    order: ExportOrder;
    register: ExportRegister;
    user: ExportUser;
  }
}
