import 'package:flutter/material.dart';
import 'dart:async';
import 'package:photo_view/photo_view.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class TwoPage extends StatefulWidget {

  @override
  _MyWidgetState createState() => _MyWidgetState();
  
}

class _MyWidgetState extends State<TwoPage> {
  bool isLoading = true;
  final sList = [
    { 'label': '记账单', 'icon': '记账单' },
    { 'label': '支出', 'icon': '记账单' },
    { 'label': '收入', 'icon': '记账单' },
    { 'label': '设置', 'icon': '记账单' },
    { 'label': '退出登录', 'icon': '记账单' },
  ];

  void initState() {
    Timer(Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('账本'),
      ),
      body: Center(
        child: GestureDetector(
          child: 
            isLoading 
            ? 
            LoadingAnimationWidget.staggeredDotsWave(color: Colors.blue, size: 50) 
            : 
            Text('内容'),
        )
      ),
    );
  }
}
