import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:Demo/pages/login.dart';

class SettingPage extends StatelessWidget {

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('警告'),
          content: Text('确定退出登录吗？'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('取消'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Text('确定'),
            ),
          ],
        );
      },
    );
  }

  // final sList = [
  //   { 'label': '记账单', 'icon': '' },
  //   { 'label': '支出', 'icon': '' },
  //   { 'label': '收入', 'icon': '' },
  //   { 'label': '设置', 'icon': '' },
  //   { 'label': '关于', 'icon': '' },
  // ];
  final sList = ['记账单', '支出', '收入', '设置', '退出登录'];
  
  String get avatarUrl => '../../../assets/images/pc_bg.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        child: ListView(
          children: [
            Container(
              color: Colors.white,
              child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 90,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0), // 设置圆角半径，可根据需要调整
                            child: Image.asset('assets/images/pc_bg.jpg')
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10,0,0,0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: Text('小学生', 
                                  style: TextStyle(fontSize: 15.0, color: Colors.black, fontWeight: FontWeight.bold)
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 0, 135, 0),
                                    child: Text('用户号：京A88888', style: TextStyle(fontSize: 12.0,)),
                                  ),
                                  Icon(Icons.arrow_forward_ios_rounded, size: 15.0, color: Colors.black), // 图标使用Icons库中的图标
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 10,
                  color: Color(0xfffdf7fe),
                ),
                Container(
                  child: Column(
                    children: sList.map((item) {
                      return Container(
                        color: Colors.white, // 设置背景颜色为白色
                        child: ListTile(
                          leading: Icon(Icons.kebab_dining_sharp),
                          title: Text(item),
                          onTap: () {
                            if (item == '退出登录') {
                              showAlertDialog(context);
                              return;
                            }
                          },
                        ),
                      );
                    }).toList(),
                  ),
                )
              ]
            ),
            )
          ]
        ),
      )
    );
  }
}
