import 'dart:async';

import 'package:appmodel/src/layout/components/BackToolBar.dart';
import 'package:appmodel/src/layout/components/LogoWidget.dart';
import 'package:appmodel/src/layout/home/HomeWidget.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SplashWidget extends StatefulWidget {
  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Timer(Duration(milliseconds: 2000), () {
      print("observable go");
      Navigator.push(
          context,
          PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 1000),
              pageBuilder: (BuildContext context, Animation animation,
                      Animation secondaryAnimation) =>
                  HomeWidget()));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _itemsGeneral() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 200, maxHeight: 200),
          child: LogoWidget(),
        ),
        Container(
          height: 50,
        ),
        Text("Carregando...")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
          BackToolBar(),
          _itemsGeneral(),
          Positioned(
            bottom: 30,
            child: Container(
              width: 100,
              child: Image.asset("assets/imgs/angel.png"),
            ),
          ),
        ],
      ),
    );
  }
}
