import 'package:flutter/material.dart';

class BackToolBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "imageBackground",
      child: Image.asset("assets/imgs/background.jpeg", fit: BoxFit.cover,),
    );
  }
}