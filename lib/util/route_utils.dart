import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '/config/route_config.dart';
import '/util/log_utils.dart';

class RouteUtils {
  static FluroRouter fluroRouter = FluroRouter();
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static void init() {
    // 路由页面配置
    RouteConfig.initHandler(fluroRouter);
    LogUtils.info('RouteHelper init.');
  }

  // 跳转
  static void push(String path, {Map<String, String>? params}) {
    if (params != null && params.isNotEmpty) {
      path += '?' + params.entries.map((e) => '${e.key}=${Uri.encodeComponent(e.value)}').join('&');
    }
    BuildContext? context = navigatorKey.currentContext;
    if (context == null) {
      return;
    }
    fluroRouter.navigateTo(context, path, transition: TransitionType.fadeIn);
  }

  // 跳转
  static void pushPage(Widget targetPage) {
    BuildContext? context = navigatorKey.currentContext;
    if (context == null) {
      return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return targetPage;
    }));
  }

  // 返回
  static void pop<T>([T? result]) {
    BuildContext? context = navigatorKey.currentContext;
    if (context == null) {
      return;
    }
    fluroRouter.pop(context, result);
  }

  // 路由返回指定页面
  static void goBack(String path) {
    BuildContext? context = navigatorKey.currentContext;
    if (context == null) {
      return;
    }
    Navigator.popAndPushNamed(context, path);
  }

  // 跳转到主页面
  static void goIndex() {
    BuildContext? context = navigatorKey.currentContext;
    if (context == null) {
      return;
    }
    fluroRouter.navigateTo(context, RouteConfig.root, clearStack: true, transition: TransitionType.fadeIn);
  }

  // 跳转到引导页
  static void goGuide() {
    BuildContext? context = navigatorKey.currentContext;
    if (context == null) {
      return;
    }
    fluroRouter.navigateTo(context, RouteConfig.guide, clearStack: true, transition: TransitionType.fadeIn);
  }

  // 跳转到主页面
  static void goHome() {
    BuildContext? context = navigatorKey.currentContext;
    if (context == null) {
      return;
    }
    fluroRouter.navigateTo(context, RouteConfig.main, clearStack: true, transition: TransitionType.fadeIn);
  }

  // 跳转到登录页面
  static void goLogin() {
    BuildContext? context = navigatorKey.currentContext;
    if (context == null) {
      return;
    }
    fluroRouter.navigateTo(context, RouteConfig.login, clearStack: true, transition: TransitionType.fadeIn);
  }
}
