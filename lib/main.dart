import 'package:flutter/material.dart';

import 'move.dart';

void main() {
  runApp(const MoveExample());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Animations'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  int _counter = 0;
  AnimationController? _animationController;
  Animation<double>? _animation;
  Animation<double>? _opacityAnimation;
  Animation<Offset>? _slideAnimation;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: const Duration(seconds: 1));
    _animation = Tween<double>(begin: 60,end: 100).animate(
        CurvedAnimation(
            parent: _animationController!,
            curve: Curves.linear
        )
    );
    _opacityAnimation = Tween<double>(begin: 0.0,end: 1).animate(
        CurvedAnimation(parent: _animationController!, curve: Curves.easeInOut)
    );
    _slideAnimation = Tween<Offset>(begin: const Offset(-1.5,0),end: const Offset(0,0)).animate(
        CurvedAnimation(parent: _animationController!, curve: Curves.fastOutSlowIn)
    );
    _animation!.addListener(() {
      setState(() {

      });
    });
    super.initState();
  }
  void _incrementCounter() {
    if(_counter == 0){
      _animationController!.forward();
      _counter = 1;
    }else{
      _animationController!.reverse();
      _counter = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Icon(Icons.access_time_filled,size: _animation!.value,),
                AnimatedBuilder(
                    animation: _animation!,
                    builder: (ctx,child){
                      return  Icon(Icons.pets,size: _animation!.value);
                    }
                ),
                FadeTransition(
                  opacity: _opacityAnimation!,
                  child: Container(
                    width: double.infinity,
                    height: 220,
                    color: Colors.black,
                  ),
                ),
                SlideTransition(
                  position: _slideAnimation!,
                  child:  Container(
                    width: double.infinity,
                    height: 220,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.access_time),
      ),
    );
  }
}
