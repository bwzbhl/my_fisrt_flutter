import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Layout"),
      ),
      body: Center(
          child: Wrap(
        spacing: 8.0, // 主轴(水平)方向间距
        runSpacing: 4.0, // 纵轴（垂直）方向间距
        alignment: WrapAlignment.center, //沿主轴方向居中
        children: const <Widget>[
          Chip(
            avatar:
                CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
            label: Text('Hamilton'),
          ),
          Chip(
            avatar:
                CircleAvatar(backgroundColor: Colors.red, child: Text('M')),
            label: Text('Lafayette'),
          ),
          Chip(
            avatar:
                CircleAvatar(backgroundColor: Colors.yellow, child: Text('H')),
            label: Text('Mulligan'),
          ),
          Chip(
            avatar:
                CircleAvatar(backgroundColor: Colors.green, child: Text('J')),
            label: Text('Laurens'),
          ),
        ],
      )),
    );
  }
}
