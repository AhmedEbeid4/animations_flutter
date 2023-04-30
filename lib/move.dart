import 'package:flutter/material.dart';

class MoveExample extends StatefulWidget {
  const MoveExample({Key? key}) : super(key: key);

  @override
  State<MoveExample> createState() => _MoveExampleState();
}

class _MoveExampleState extends State<MoveExample>
    with TickerProviderStateMixin {

  late AnimationController _animationController;
  late AnimationController _sizeController;
  late Animation<Offset> _animation;
  late Animation<double> _sizeAnimation;
  late AnimationController _rotateAnimationController;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _rotateAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    _sizeController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    _animation = Tween<Offset>(begin: Offset.zero, end: Offset.zero).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    _rotateAnimation = Tween<double>(begin: 0, end: 2 * (22 / 7)).animate(
        CurvedAnimation(
            parent: _rotateAnimationController, curve: Curves.easeInOut));
    _sizeAnimation = Tween<double>(begin: 100, end: 300).animate(
        CurvedAnimation(parent: _sizeController, curve: Curves.easeInOut));

    _animation.addListener(() {
      setState(() {});
    });
  }

  void changeOffsets() {}

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Expanded(child: SizedBox()),
                SlideTransition(
                  position: _animation,
                  child: AnimatedBuilder(
                    animation: _sizeAnimation,
                    builder: (BuildContext context, Widget? child) {
                      return RotationTransition(
                          turns: _rotateAnimation,
                          child: Icon(
                            Icons.account_circle_rounded,
                            size: _sizeAnimation.value,
                          ));
                    },
                  ),
                ),
                const Expanded(child: SizedBox()),
                Row(children: [
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () async {
                      await _sizeController.forward();
                      await _sizeController.reverse();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 2,
                      ),
                    ),
                    child: const Icon(Icons.donut_large_sharp),
                  )),
                  const SizedBox(width: 10,),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () async {
                      await _rotateAnimationController.forward();
                      await _rotateAnimationController.reverse();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 2,
                      ),
                    ),
                    child: const Icon(Icons.rotate_left_outlined),
                  ))
                ]),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          if(_animationController.isAnimating){
                            return;
                          }
                          print('hello');
                          _animation = Tween(
                                  begin: const Offset(0, 0),
                                  end: const Offset(0, -2))
                              .animate(CurvedAnimation(
                                  parent: _animationController,
                                  curve: Curves.easeInOut));
                          await _animationController.forward();
                          await _animationController.reverse();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 30,
                            horizontal: 2,
                          ),
                        ),
                        child: const Icon(Icons.arrow_circle_up),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          if(_animationController.isAnimating){
                            return;
                          }
                          _animation = Tween(
                                  begin: const Offset(0, 0),
                                  end: const Offset(1, 0))
                              .animate(CurvedAnimation(
                                  parent: _animationController,
                                  curve: Curves.easeInOut));
                          await _animationController.forward();
                          await _animationController.reverse();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 2),
                        ),
                        child: const Icon(Icons.arrow_circle_right_outlined),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          if(_animationController.isAnimating){
                            return;
                          }
                          _animation = Tween(
                                  begin: const Offset(0, 0),
                                  end: const Offset(0, 2))
                              .animate(CurvedAnimation(
                                  parent: _animationController,
                                  curve: Curves.easeInOut));
                          await _animationController.forward();
                          await _animationController.reverse();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 2),
                        ),
                        child: const Icon(Icons.arrow_circle_down_outlined),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          if(_animationController.isAnimating){
                            return;
                          }
                          _animation = Tween(
                                  begin: const Offset(0, 0),
                                  end: const Offset(-1, 0))
                              .animate(CurvedAnimation(
                                  parent: _animationController,
                                  curve: Curves.easeInOut));
                          await _animationController.forward();
                          await _animationController.reverse();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 2),
                        ),
                        child: const Icon(Icons.arrow_circle_left_outlined),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
