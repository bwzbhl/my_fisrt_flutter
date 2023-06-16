import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _decorationColor = Colors.blue;
  var duration = const Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedDecoratedBox Demo"),
      ),
      body: Center(
        child: AnimatedDecoratedBox1(
          duration: duration,
          decoration: MyBoxDecoration(color: _decorationColor),
          child: TextButton(
            onPressed: () {
              setState(() {
                _decorationColor = Colors.lightGreen;
              });
            },
            child: const Text(
              "AnimatedDecoratedBox",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class MyBoxDecoration extends Decoration {
  final Color? color;

  const MyBoxDecoration({this.color});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _MyBoxDecorationPainter(this, onChanged);
  }

  @override
  Decoration? lerpFrom(Decoration? a, double t) {
    if (a is MyBoxDecoration) {
      return MyBoxDecoration(
        color: Color.lerp(a.color, color, t),
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  Decoration? lerpTo(Decoration? b, double t) {
    if (b is MyBoxDecoration) {
      return MyBoxDecoration(
        color: Color.lerp(color, b.color, t),
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyBoxDecoration && runtimeType == other.runtimeType && color == other.color;

  @override
  int get hashCode => color.hashCode;

  MyBoxDecoration copyWith({Color? color}) {
    return MyBoxDecoration(
      color: color ?? this.color,
    );
  }
}


class _MyBoxDecorationPainter extends BoxPainter {
  final MyBoxDecoration _decoration;

  _MyBoxDecorationPainter(this._decoration, VoidCallback? onChanged)
      : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    if (_decoration.color != null) {
      final Rect rect = offset & configuration.size!;
      final Paint paint = Paint()..color = _decoration.color!;
      canvas.drawRect(rect, paint);
    }
  }
}

class AnimatedDecoratedBox1 extends StatefulWidget {
  const AnimatedDecoratedBox1({
    Key? key,
    required this.duration,
    required this.decoration,
    required this.child,
  }) : super(key: key);

  final Duration duration;
  final MyBoxDecoration decoration;
  final Widget child;

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedDecoratedBox1State createState() => _AnimatedDecoratedBox1State();
}

class _AnimatedDecoratedBox1State extends State<AnimatedDecoratedBox1>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: widget.duration);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AnimatedDecoratedBox1 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.decoration != oldWidget.decoration) {
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return DecoratedBox(
          decoration:
              widget.decoration.copyWith(color: widget.decoration.color?.withAlpha((_animation.value * 255).toInt())),
          child: widget.child,
        );
      },
    );
  }
}
