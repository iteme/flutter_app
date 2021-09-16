import 'package:flutter/material.dart';

import '/config/route_config.dart';
import '/generated/l10n.dart';
import '/util/route_utils.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ErrorBody(),
    );
  }
}

class ErrorBody extends StatefulWidget {
  @override
  _ErrorBodyState createState() => _ErrorBodyState();
}

class _ErrorBodyState extends State<ErrorBody> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: SizedBox(
          height: MediaQuery.of(context).size.height - 80,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const SizedBox(height: 50),
              Text(S.of(context).error404Title, style: Theme.of(context).textTheme.headline3),
              const SizedBox(height: 10),
              Text(S.of(context).error404, style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 120)),
              const SizedBox(height: 20),
              Text(S.of(context).error404Notice,
                  style: Theme.of(context).textTheme.headline6!.copyWith(height: 1.5), textAlign: TextAlign.center),
              const SizedBox(height: 30),
              TextButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 50, vertical: 25)),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                    side: BorderSide(width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  )),
                ),
                onPressed: () {
                  RouteUtils.push(RouteConfig.main);
                },
                child: Text(
                  S.of(context).appBackHome,
                  style: Theme.of(context).textTheme.headline5,
                ),
              )
            ],
          )),
    );
  }
}
