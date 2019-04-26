import 'package:appmodel/src/appBloc.dart';
import 'package:appmodel/src/layout/splash/splashWidget.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  
  _getTheme(bool isDark){
    if(isDark){
      return ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        fontFamily: 'OpenSans'
      );
    } else {
      return ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        fontFamily: 'OpenSans'
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder(
      stream: BlocProvider.of<AppBloc>(context).themeOut,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if(!snapshot.hasData) return Container();

        return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _getTheme(snapshot.data),
      //home: SplashWidget(),
      home: SplashWidget(),
    );
      },);
  }
}
