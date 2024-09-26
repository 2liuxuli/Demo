import 'dart:developer';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:Demo/pages/login.dart';
import 'package:photo_view/photo_view.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

enum MyIcons { book, monetization_on_outlined, wallet, settings, login }
class SettingPage extends StatefulWidget {

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SettingPage>{


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


// enum MyIcons { book, monetization_on_outlined, wallet, settings, login }


  // final sList = ['记账单', '支出', '收入', '设置', '退出登录'];
  final sList = [
    { 'label': '记账单', 'icon': 'MyIcons.book' },
    { 'label': '支出', 'icon':'MyIcons.monetization_on_outlined' },
    { 'label': '收入', 'icon': 'MyIcons.wallet' },
    { 'label': '设置', 'icon': 'MyIcons.settings' },
    { 'label': '退出登录', 'icon': 'MyIcons.login' },
  ];

    bool isLoading = true;

    void initState() {
      Timer(Duration(seconds: 1), () {
        setState(() {
          isLoading = false;
        });
      });
    }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: isLoading
        ?
        Center(
          child: LoadingAnimationWidget.staggeredDotsWave(color: Colors.blue, size: 50),
        )
        : Container(
          child: ListView(
            children: [
              Container(
                child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 90,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0), // 设置圆角半径，可根据需要调整
                              child: PhotoView(
                                imageProvider: AssetImage('assets/images/pc_bg.jpg'),
                              )
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
                                      child: Text('用户号1：京A88888', style: TextStyle(fontSize: 12.0,)),
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
                      children: sList.asMap().entries.map((entry) {
                        int index = entry.key;
                        var item = entry.value;
                        return Container(
                          // color: Colors.green,
                          child: ListTile(
                            // leading: Icon(Icons[item['icon']!]),
                            // leading: Icon(item['icon']! == MyIcons.book? Icons.book : Icons.question_mark),
                            leading: Icon(Icons.face),
                            title: Text(item['label']!),
                            subtitle: Text('Index: $index'),
                            onTap: () {
                              if (item['label']! == '退出登录') {
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
