import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '/api/auth_api.dart';
import '/config/route_config.dart';
import '/generated/l10n.dart';
import '/util/route_utils.dart';
import '/util/toast_utils.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;

  final TextEditingController _usernameTextController = TextEditingController();

  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [buildLogo(), buildMain()],
        ),
      ),
    );
  }

  Widget buildLogo() => Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 80, 10, 50),
          child: Text(
            S.of(context).appName,
            style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
      );

  Widget buildMain() => Expanded(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))),
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLoginForm(),
                  buildTextButton(),
                  buildLoginButton(),
                ],
              ),
            ),
          ),
        ),
      );

  Widget buildLoginForm() => Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
      child: Column(
        children: [
          TextField(
            controller: _usernameTextController,
            style: const TextStyle(color: Colors.grey),
            textAlign: TextAlign.left,
            autocorrect: false,
            cursorColor: Colors.grey,
            maxLines: 1,
            decoration: InputDecoration(
                border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                hintText: S.of(context).loginAccount,
                hintStyle: const TextStyle(color: Colors.grey),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.grey,
                  ),
                  onPressed: () => _usernameTextController.clear(),
                )),
          ),
          TextField(
            controller: _passwordTextController,
            style: const TextStyle(color: Colors.grey),
            textAlign: TextAlign.left,
            obscureText: !showPassword,
            autocorrect: false,
            cursorColor: Colors.grey,
            maxLines: 1,
            decoration: InputDecoration(
                border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                hintText: S.of(context).loginPassword,
                hintStyle: const TextStyle(color: Colors.grey),
                suffixIcon: IconButton(
                  icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off, color: Colors.grey),
                  onPressed: () => setState(() => showPassword = !showPassword),
                )),
          ),
        ],
      ));

  Widget buildTextButton() => Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(TextSpan(
            text: S.of(context).register,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                RouteUtils.push(RouteConfig.register);
              },
          )),
          Text.rich(TextSpan(
            text: S.of(context).loginForget,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                RouteUtils.push(RouteConfig.register);
              },
          )),
        ],
      ));

  Widget buildLoginButton() => Center(
        child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)))),
                onPressed: () async {
                  var username = _usernameTextController.value.text;
                  var password = _passwordTextController.value.text;
                  if (username.isEmpty || password.isEmpty) {
                    return;
                  }
                  var token = await AuthApi.login(username, password);
                  if (token != null) {
                    RouteUtils.goHome();
                  } else {
                    ToastUtils.showToast(S.of(context).loginError);
                  }
                },
                child: Text(
                  S.of(context).login,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            )),
      );
}
