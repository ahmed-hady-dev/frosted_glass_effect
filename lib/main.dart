import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double contSize = size.width * 0.9;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.asset(
                'assets/images/design.jpg',
              ).image,
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: FrostedGlassBox(
              height: contSize,
              width: contSize,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ahmed Abd ElHady',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white.withOpacity(0.4),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(
                      color: Colors.white.withOpacity(0.4),
                      endIndent: 40,
                      indent: 40,
                    ),
                    Text(
                      'Frosted Glass',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FrostedGlassBox extends StatelessWidget {
  final double height, width;
  final Widget child;

  const FrostedGlassBox(
      {Key key,
      @required this.height,
      @required this.width,
      @required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        width: width,
        height: height,
        child: Container(
          height: height,
          width: width,
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 7.0,
                  sigmaY: 7.0,
                ),
                child: Container(
                  height: height,
                  width: width,
                  child: Text(' ss'),
                ),
              ),
              Opacity(
                opacity: 0.15,
                child: Image.asset(
                  'assets/images/noise.png',
                  width: width,
                  height: height,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.25))],
                  border: Border.all(
                      color: Colors.white.withOpacity(0.2), width: 1.0),
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.2),
                    ],
                    stops: [0.0, 1.0],
                  ),
                ),
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
