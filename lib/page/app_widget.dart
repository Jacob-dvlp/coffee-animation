import 'package:coffe_animation/page/coffe_list.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: const CoffeList(),
    );
  }
}
