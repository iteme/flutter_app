import 'package:flutter/material.dart';

import '/generated/l10n.dart';
import '/res/app_images.dart';
import '/util/route_utils.dart';
import '/util/storage_utils.dart';

class GuidePage extends StatefulWidget {
  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          //第一层的图片
          buildBackground(width, height),
          //第二层的点指示
          buildDotGroup(),
          //第三层的去首页
          buildGoHome(),
        ],
      ),
    );
  }

  Positioned buildGoHome() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 60,
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: _currentIndex == 3 ? 50 : 0,
            width: _currentIndex == 3 ? 150 : 0,
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
              child: Text(
                S.of(context).guideEnter,
                style: const TextStyle(fontSize: 18),
              ),
              onPressed: () {
                StorageUtils.save(StorageUtils.firstInstall, true);
                RouteUtils.goIndex();
              },
            ),
          ),
        ],
      ),
    );
  }

  Positioned buildDotGroup() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 60,
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildDot(_currentIndex == 0),
          buildDot(_currentIndex == 1),
          buildDot(_currentIndex == 2),
          buildDot(_currentIndex == 3),
        ],
      ),
    );
  }

  Widget buildDot(bool isSelect) {
    return AnimatedContainer(
      height: 8,
      width: isSelect ? 40 : 8,
      margin: const EdgeInsets.only(left: 16),
      duration: const Duration(milliseconds: 500),
      decoration: const BoxDecoration(
        color: Color(0x80ffffff),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }

  Positioned buildBackground(double width, double height) {
    return Positioned.fill(
      child: PageView(
        onPageChanged: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        children: [
          Image.asset(AppImages.guide1, width: width, height: height, fit: BoxFit.fill),
          Image.asset(AppImages.guide2, width: width, height: height, fit: BoxFit.fill),
          Image.asset(AppImages.guide3, width: width, height: height, fit: BoxFit.fill),
          Image.asset(AppImages.guide4, width: width, height: height, fit: BoxFit.fill),
        ],
      ),
    );
  }
}
