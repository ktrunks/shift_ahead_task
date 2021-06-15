import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:task/ui/detail/detail_screen.dart';
import 'package:task/ui/home/home_screen.dart';

/// root application launch
final Handler rootHandler =
    Handler(handlerFunc: (context, params) => getHomeScreen());

Widget getHomeScreen() {
  return HomeScreen();
}

/// cart screen  launch
final Handler detailHandler = Handler(handlerFunc: (context, params) {
  final obj = ModalRoute.of(context).settings.arguments;
  return DetailScreen(obj);
});
