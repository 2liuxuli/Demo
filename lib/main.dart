import 'package:flutter/material.dart';

// 底部Tab类
import 'package:flutterapp01/pages/BottomBar/home.dart';
import 'package:flutterapp01/pages/BottomBar/two.dart';
import 'package:flutterapp01/pages/BottomBar/setting.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _BottomBarState createState() => _BottomBarState();
}


class _BottomBarState extends State<MyApp> {

  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    TwoPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
            activeIcon: Icon(Icons.ac_unit, color: Colors.green)
          ),
          BottomNavigationBarItem(icon: Icon(Icons.looks), label: '浏览', activeIcon: Icon(Icons.ac_unit, color: Colors.green)),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '设置', activeIcon: Icon(Icons.ac_unit, color: Colors.green)),
        ],
        onTap: (value) => {
          setState(() {
            _currentIndex = value;
          })
        },
      ),
    );
  }
}
