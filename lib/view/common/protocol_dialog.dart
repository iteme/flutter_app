import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/config/app_config.dart';
import '/generated/l10n.dart';
import '/util/log_utils.dart';
import '/util/route_utils.dart';
import '/util/storage_utils.dart';
import '/widget/web_view_widget.dart';

class ProtocolDialog extends StatelessWidget {
  final TapGestureRecognizer _registerProtocolRecognizer = TapGestureRecognizer();
  final TapGestureRecognizer _privacyProtocolRecognizer = TapGestureRecognizer();

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(S.of(context).dialogPrompt),
      content: Container(
        height: 240,
        padding: const EdgeInsets.all(5),
        // 可滑动布局
        child: SingleChildScrollView(
          child: buildContent(context),
        ),
      ),
      actions: [
        CupertinoDialogAction(
          child: Text(S.of(context).dialogDisagree),
          onPressed: () {
            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          },
        ),
        CupertinoDialogAction(
          child: Text(S.of(context).dialogAgree),
          onPressed: () {
            StorageUtils.save(StorageUtils.protocolAgreed, true);
            LogUtils.info('protocol agreed');
            RouteUtils.pop(context);
          },
        ),
      ],
    );
  }

  buildContent(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: S.of(context).protocolNotice,
        style: TextStyle(color: Colors.grey[600]),
        children: [
          TextSpan(
            text: S.of(context).protocolMembershipText,
            style: const TextStyle(color: Colors.blue, fontStyle: FontStyle.italic),
            //点击事件
            recognizer: _registerProtocolRecognizer
              ..onTap = () {
                //打开用户协议
                RouteUtils.pushPage(WebViewWidget(
                  title: S.of(context).protocolMembership,
                  url: AppConfig.membershipProtocolUrl,
                ));
              },
          ),
          TextSpan(
            text: S.of(context).protocolAnd,
            style: TextStyle(color: Colors.grey[600]),
          ),
          TextSpan(
            text: S.of(context).protocolPrivacyText,
            style: const TextStyle(color: Colors.blue, fontStyle: FontStyle.italic),
            //点击事件
            recognizer: _privacyProtocolRecognizer
              ..onTap = () {
                //打开隐私协议
                RouteUtils.pushPage(WebViewWidget(
                  title: S.of(context).protocolPrivacy,
                  url: AppConfig.privacyProtocolUrl,
                ));
              },
          ),
          const TextSpan(
            text: '\n',
          ),
          TextSpan(
            text: S.of(context).protocolNoticeContent,
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
