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
    return GridView(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 120.0, childAspectRatio: 2.0 //宽高比为2
          ),
      children: const <Widget>[
        Icon(Icons.ac_unit, size: 52, color: Colors.blue),
        Icon(Icons.airport_shuttle, size: 52, color: Colors.purple),
        Icon(Icons.all_inclusive, size: 52, color: Colors.green),
        Icon(Icons.beach_access, size: 52, color: Colors.grey),
        Icon(Icons.cake, size: 52, color: Colors.pink),
        Icon(Icons.free_breakfast, size: 52, color: Colors.brown),
      ],
    );
  }
}
