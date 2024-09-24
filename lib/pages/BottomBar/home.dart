import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        backgroundColor: Colors.green
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(15, (index) => Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            color: Colors.yellow,
            child: Center(
              child: Text('$index'),
            ),
          ),
        ))
      )
    );
  }
}
