import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Signature(),
    );
  }
}

class Signature extends StatefulWidget {
  SignatureState createState() => new SignatureState();
}

class SignatureState extends State<Signature>
    with SingleTickerProviderStateMixin {
  double _y = 0.0;

  Widget build(BuildContext context) {
    return new GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        RenderBox referenceBox = context.findRenderObject();
        Offset localPosition =
        referenceBox.globalToLocal(details.globalPosition);
        springSimulation = new SpringSimulation(
            spring, _y, localPosition.dy, animationController.velocity);
        animationController.animateWith(springSimulation);
      },
      child: new CustomPaint(painter: new SignaturePainter(_y)),
    );
  }

  SpringDescription spring = new SpringDescription(
      mass: 1.0, stiffness: 100.0, damping: 10.0);
  SpringSimulation springSimulation;
  AnimationController animationController;

  initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      lowerBound: double.negativeInfinity,
      upperBound: double.infinity,
    );
    animationController.addListener(() {
      print(animationController.value);
      setState(() {
        print(animationController.value);
        _y = animationController.value;
      });
    });
  }
}

class SignaturePainter extends CustomPainter {
  final double y;

  SignaturePainter(this.y);

  void paint(Canvas canvas, Size size) {
    var paint = new Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 20.0;
    canvas.drawCircle(new Offset(size.width / 2, y), 20.0, paint);
  }

  bool shouldRepaint(SignaturePainter other) => other.y != y;
}