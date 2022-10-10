import 'package:coffe_animation/constantes/images_const.dart';
import 'package:coffe_animation/page/coffe_list.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 6),
      () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const CoffeList(),
          )),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const SizedBox.expand(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0XFFA89276),
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 75,
          left: 0,
          right: 0,
          child: Image.asset(
            image12,
            scale: 1,
          ),
        ),
        Positioned(
          bottom: 15,
          left: 0,
          right: 0,
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: LinearProgressIndicator(
              color: Colors.brown[300],
              backgroundColor: Colors.white,
            ),
          )),
        ),
        const Positioned(
          left: 0,
          right: 0,
          top: 100,
          child: Text(
            'Coffee',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 50,
                color: Colors.white,
                fontStyle: FontStyle.italic),
          ),
        )
      ],
    ));
  }
}
