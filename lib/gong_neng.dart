import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const WillPopScopeTestRoute(), // 将主页设置为返回键拦截示例
    theme: ThemeData(primarySwatch: Colors.blue),
  ));
}

class WillPopScopeTestRoute extends StatefulWidget {
  const WillPopScopeTestRoute({Key? key}) : super(key: key);

  @override
  WillPopScopeTestRouteState createState() => WillPopScopeTestRouteState();
}

class WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
  DateTime? _lastPressedAt; //上次点击时间
  var _themeColor = Colors.teal; //当前路由主题色

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context); // 获取上下文中的主题数据
    return Theme(
      data: themeData.copyWith(
        primaryColor: _themeColor, //用于导航栏、FloatingActionButton的背景色等
        iconTheme: IconThemeData(color: _themeColor), //用于Icon颜色
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("返回键拦截示例 & 主题测试"),
        ),
        body: Center(
          child: WillPopScope(
            onWillPop: () async {
              if (_lastPressedAt == null ||
                  DateTime.now().difference(_lastPressedAt!) > const Duration(seconds: 1)) {
                //两次点击间隔超过1秒则重新计时
                _lastPressedAt = DateTime.now();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('再按一次退出应用'),
                  duration: Duration(seconds: 1),
                ));
                return false;
              }
              return true;
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //第一行Icon使用主题中的iconTheme
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.favorite),
                    Icon(Icons.airport_shuttle),
                    Text("  颜色跟随主题")
                  ],
                ),
                //为第二行Icon自定义颜色（固定为黑色)
                Theme(
                  data: themeData.copyWith(
                    iconTheme: themeData.iconTheme.copyWith(color: Colors.black),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.favorite),
                      Icon(Icons.airport_shuttle),
                      Text("  颜色固定黑色")
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() {
            _themeColor = _themeColor == Colors.teal ? Colors.blue : Colors.teal;
          }),
          child: const Icon(Icons.palette),
        ),
      ),
    );
  }
}

