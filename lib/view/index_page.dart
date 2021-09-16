import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/api/auth_api.dart';
import '/util/route_utils.dart';
import '/util/storage_utils.dart';
import '/view/common/protocol_dialog.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexPageState();
  }
}

class _IndexPageState extends State<IndexPage> {
  @override
  void initState() {
    super.initState();
    initPage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Theme.of(context).primaryColor);
  }

  void initPage() async {
    await StorageUtils.init();
    // 判断是否同意用户协议
    bool? isAgreement = StorageUtils.getBool(StorageUtils.protocolAgreed);

    if (isAgreement == null) {
      // 用户协议弹框
      await showCupertinoDialog(
        //上下文对象
        context: context,
        //对话框内容
        builder: (BuildContext context) {
          return ProtocolDialog();
        },
      );
      isAgreement = StorageUtils.getBool(StorageUtils.protocolAgreed);
    }
    if (isAgreement == null || !isAgreement) {
      return;
    }

    // 判断是否第一次安装应用
    bool? isFirstInstall = StorageUtils.getBool(StorageUtils.firstInstall);
    if (isFirstInstall == null) {
      RouteUtils.goGuide();
      return;
    }

    // token刷新
    String? token = await AuthApi.refresh();
    if (token == null) {
      // 直接跳转首页
      RouteUtils.goLogin();
    } else {
      // 重新登录
      RouteUtils.goHome();
    }
  }
}
