// This file is created by egg-ts-helper@1.25.6
// Do not modify this file!!!!!!!!!

import 'egg';
import ExportAdmin = require('../../../app/service/admin');
import ExportGoods = require('../../../app/service/goods');
import ExportOrder = require('../../../app/service/order');
import ExportRegister = require('../../../app/service/register');
import ExportUser = require('../../../app/service/user');

declare module 'egg' {
  interface IService {
    admin: ExportAdmin;
    goods: ExportGoods;
    order: ExportOrder;
    register: ExportRegister;
    user: ExportUser;
  }
}
