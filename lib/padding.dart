import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PaddingTestRoute(title: 'Padding'),
    );
  }
}

class PaddingTestRoute extends StatelessWidget {
  const PaddingTestRoute({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      //上下左右各添加16像素补白
      padding: const EdgeInsets.all(16),
      child: Column(
        //显式指定对齐方式为左对齐，排除对齐干扰
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          Padding(
            //左边添加8像素补白
            padding: EdgeInsets.only(left: 8),
            child: Text(
              '周一菜单:',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 37.0,
                  height: 1.2,
                  fontFamily: "Courier",
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
          ),
          SizedBox(),
          Padding(
            //上下各添加8像素补白
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              '周二菜单:',
              style: TextStyle(
                  color: Colors.purple,
                  fontSize: 37.0,
                  height: 1.2,
                  fontFamily: "Courier",
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
          ),
          Padding(
            // 分别指定四个方向的补白
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text(
              "Your friend",
              style: TextStyle(
                  color: Colors.pink,
                  fontSize: 37.0,
                  height: 1.2,
                  fontFamily: "Courier",
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
          )
        ],
      ),
    );
  }
}
