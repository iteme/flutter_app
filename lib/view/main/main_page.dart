import 'package:flutter/material.dart';

import '/generated/l10n.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //当前选中的标识
  int _currentIndex = 0;

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: PageView(
          controller: _pageController,
          //不可左右滑动
          physics: const NeverScrollableScrollPhysics(),
          children: const [],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //当前选中的Item 默认为 0
        currentIndex: _currentIndex,
        //点击回调
        onTap: (int value) {
          setState(() {
            _currentIndex = value;
            _pageController.jumpToPage(value);
          });
        },
        //显示文字
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.home), label: S.of(context).navHome),
          BottomNavigationBarItem(icon: const Icon(Icons.person), label: S.of(context).navAccount),
        ],
      ),
    );
  }
}
