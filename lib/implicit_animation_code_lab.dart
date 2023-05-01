import 'package:flutter/material.dart';

class ImplicitAnimations extends StatefulWidget {
  const ImplicitAnimations({Key? key}) : super(key: key);

  @override
  State<ImplicitAnimations> createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations> {
  double height = 300;
  double _currSize = 0;
  double opacity = 1;
  double _padding = 50;
  double _endValue = -100;
  double _iconSize = 100;
  double rotateAngle = 90;
  Widget currWidget = Container(
    width: 300,
    height: 300,
    color: Colors.black,
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onDoubleTap: () {
                        setState(() {
                          height = height == 300 ? 500 : 300;
                        });
                      },
                      child: AnimatedContainer(
                        height: height,
                        width: 300,
                        color: Colors.blue,
                        duration: const Duration(milliseconds: 500),
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 20,),
                TweenAnimationBuilder(
                    tween: SizeTween(begin: const Size(30,30),end: Size(_currSize * 120,_currSize * 120)),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.slowMiddle,
                    builder: (_,value,__){
                      return Icon(Icons.star,size: value?.width,);
                    }
                ),
                Slider.adaptive(
                    value: _currSize,
                    onChanged: (val){
                      print('$val');
                          setState(() {
                        _currSize = val;
                      });
                    }
                ),
                const SizedBox(height: 30,),
                GestureDetector(
                  onLongPress: (){
                    setState(() {
                      if(opacity == 1){
                        opacity = 0.1;
                      }else{
                        opacity = 1;
                      }
                    });
                  },
                  child: AnimatedOpacity(
                      opacity: opacity,
                      duration: const Duration(seconds: 1),
                      child: Container(
                        height: 300,
                        width: 300,
                        color: Colors.blue,
                      ),
                  ),
                ),
                const SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      _padding = _padding == 50 ? 0 :50;
                    });
                  },
                  child: AnimatedPadding(
                    padding: EdgeInsets.only(top: _padding),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: Container(
                      height: 300,
                      width: 300,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 50,),
                GestureDetector(
                  onDoubleTap: (){
                    setState(() {
                      if(currWidget is Container){
                        currWidget = const FlutterLogo();
                      }else{
                        currWidget = Container(
                          width: 300,
                          height: 300,
                          color: Colors.black,
                        );
                      }
                    });
                  },
                  child: AnimatedSwitcher(
                    duration: const Duration(seconds: 1),
                    child: currWidget,
                    transitionBuilder: (child,ani){
                      return RotationTransition(
                          turns: ani,
                          child: child,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20,),
                TweenAnimationBuilder(
                    tween: Tween<double>(
                        begin: 0,
                        end: _iconSize
                    ),
                    onEnd: (){
                      setState(() {
                        _iconSize = _iconSize == 100 ? 0 :100;
                      });
                    },
                    duration: const Duration(seconds: 1),
                    builder: (ctx,value,_){
                      return Icon(Icons.account_circle_rounded,size: value);
                    }),
                const SizedBox(height: 20,),
                TweenAnimationBuilder(
                    tween: Tween<double>(
                      begin: 20,
                      end: _endValue
                    ),
                    duration: const Duration(seconds: 1),
                    onEnd: (){
                      setState(() {
                        if(_endValue == -100){
                          _endValue = 0;
                        }else{
                          _endValue = -100;
                        }
                      });
                    },
                    builder: (ctx,value,_){
                      return Transform.translate(
                          offset: Offset(value,0),
                          child: _
                      );
                    },
                    child: Container(
                      height: 300,
                      width: 300,
                      color: Colors.amber,
                    )
                ),
                TweenAnimationBuilder(
                    tween: Tween<double>(
                        begin: 20,
                        end: rotateAngle
                    ),
                    duration: const Duration(seconds: 1),
                    onEnd: (){
                      setState(() {
                        if(rotateAngle == 90){
                          rotateAngle = 0;
                        }else{
                          rotateAngle = 90;
                        }
                      });
                    },
                    builder: (ctx,value,_){
                      return Transform.rotate(
                          angle: value,
                          child: _
                      );
                    },
                    child: const Icon(Icons.star,size: 50,)
                ),
                const SizedBox(height: 100,)
              ]
              ),
            ),
          ),
        ));
  }
}
