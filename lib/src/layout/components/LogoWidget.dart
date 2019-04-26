import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "imageLogo",
      child: Image.asset("assets/imgs/logo.png", fit: BoxFit.contain,),
    );
  }
}