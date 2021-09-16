import 'package:fluro/fluro.dart';

import '/view/error/error_page.dart';
import '/view/guide/guide_page.dart';
import '/view/index_page.dart';
import '/view/login/forget_page.dart';
import '/view/login/login_page.dart';
import '/view/login/register_page.dart';
import '/view/main/main_page.dart';

class RouteConfig {
  static const String root = '/';
  static const String guide = '/guide';
  static const String login = '/login';
  static const String register = '/register';
  static const String forget = '/forget';
  static const String main = '/main';

  static void initHandler(FluroRouter router) {
    router.notFoundHandler = Handler(handlerFunc: (ctx, params) => ErrorPage());
    router.define(root, handler: Handler(handlerFunc: (ctx, params) => IndexPage()));
    router.define(guide, handler: Handler(handlerFunc: (ctx, params) => GuidePage()));
    router.define(login, handler: Handler(handlerFunc: (ctx, params) => LoginPage()));
    router.define(register, handler: Handler(handlerFunc: (ctx, params) => RegisterPage()));
    router.define(forget, handler: Handler(handlerFunc: (ctx, params) => ForgetPage()));
    router.define(main, handler: Handler(handlerFunc: (ctx, params) => MainPage()));
  }
}
