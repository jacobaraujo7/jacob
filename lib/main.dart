import 'package:appmodel/src/appBloc.dart';
import 'package:appmodel/src/appWidget.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

void main() => runApp(BlocProvider<AppBloc>(
  bloc: AppBloc(),
  child: MyApp(),));


