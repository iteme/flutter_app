import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '/generated/l10n.dart';
import '/res/app_theme.dart';
import '/util/http_utils.dart';
import '/util/log_utils.dart';
import '/util/route_utils.dart';
import '/view/index_page.dart';

void main() {
  init().then((value) => runApp(MyApp()));
}

Future<void> init() async {
  LogUtils.init();
  RouteUtils.init();
  HttpUtils.init();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 返回主页面
    return MaterialApp(
      title: 'App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      navigatorKey: RouteUtils.navigatorKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteUtils.fluroRouter.generator,
      home: IndexPage(),
    );
  }
}
