import 'package:flutter/material.dart';
import 'package:random_number/screen/custom_widget/custom_appbar.dart';
import 'package:random_number/theme/images.dart';
import 'package:sensors/sensors.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class NumberGameScreen extends StatefulWidget {
  @override
  _NumberGameScreenState createState() => _NumberGameScreenState();
}

class _NumberGameScreenState extends State<NumberGameScreen> with SingleTickerProviderStateMixin{
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 5));
    animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(child: AnimatedBuilder(child:Container(decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Images.clock_background),
                fit: BoxFit.fitHeight)),),animation: animationController, builder: (BuildContext context,Widget _widget){
          return Transform.rotate(angle: animationController.value*6.3,child: _widget,);
        }),


        ),
        Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  height: 100,
                  color: Colors.transparent,
                )),
            Expanded(
                flex: 4,
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(fit: BoxFit.cover,
                          image: AssetImage(Images.background))),
                )),
          ],
        )
      ],
    ));
  }
}
