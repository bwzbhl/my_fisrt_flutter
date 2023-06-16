import 'package:flutter/material.dart';
//运行有问题！！！！
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slide Transition X 示例',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SlideTransitionXDemo(),
    );
  }
}

class SlideTransitionXDemo extends StatefulWidget {
  const SlideTransitionXDemo({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SlideTransitionXDemoState createState() => _SlideTransitionXDemoState();
}

class _SlideTransitionXDemoState extends State<SlideTransitionXDemo> {
  bool _isShown = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slide Transition X 示例'),
      ),
      body: Center(
        child: SlideTransitionX(
          offset: _isShown ? 0 : MediaQuery.of(context).size.width,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'See here',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _isShown = !_isShown;
        }),
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}

class SlideTransitionX extends StatefulWidget {
  final double offset;
  final Widget child;
  final int durationMilliseconds;

  // ignore: use_key_in_widget_constructors
  const SlideTransitionX({
    required this.offset,
    required this.child,
    this.durationMilliseconds = 500,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SlideTransitionXState createState() => _SlideTransitionXState();
}

class _SlideTransitionXState extends State<SlideTransitionX>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.durationMilliseconds),
    );

    _animation =
        Tween<double>(begin: -widget.offset, end: 0).animate(_controller);

    // 开始动画
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(_animation.value, 0),
          child: child,
        );
      },
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
