import 'package:flutter/material.dart';

class TwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('账本'),
      ),
      body: Center(
        child: Text('第二页面内容'),
      ),
    );
  }
}