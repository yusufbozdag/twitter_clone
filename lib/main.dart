import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home/tabbar_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: const TwitterTabbarView(),
      theme: ThemeData.light().copyWith(
      appBarTheme: AppBarTheme(color: Theme.of(context).scaffoldBackgroundColor),
      tabBarTheme: const TabBarTheme(labelColor: CupertinoColors.activeBlue,
      unselectedLabelColor: CupertinoColors.inactiveGray,
      )),
    );
  }
}