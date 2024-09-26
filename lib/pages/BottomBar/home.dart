import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('提示'),
          content: Text('这是一个弹窗内容。'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('确定'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('记账单'),
        backgroundColor: Colors.green
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(15, (index) => Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: index == 1 ? () {
              showAlertDialog(context);
            } : null,
            child: Container(
              color: Colors.yellow,
              child: Center(
                child: Text(('$index'))
              ),
            ),
          )
        ))
      )
    );
  }
}

