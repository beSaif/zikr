import 'package:flutter/material.dart';
import 'package:zikr/screens/home/components/body.dart';
import 'package:zikr/screens/login/login.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zikr',
      home: LoginIn(),
    );
  }
}
