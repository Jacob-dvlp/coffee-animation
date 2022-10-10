import 'package:coffe_animation/model/coffee.dart';
import 'package:flutter/material.dart';

class PageAbout extends StatelessWidget {
  final Coffee coffee;
  const PageAbout({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: const Color(0XFFA89276),
          title: Text(coffee.name!),
        ),
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
              bottom: 100,
              right: 0,
              left: 0,
              child: Hero(
                transitionOnUserGestures: true,
                tag: coffee,
                child: Image.asset(coffee.img!),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 20,
              left: 20,
              height: 150,
              child: Center(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Text(
                    '\$${coffee.price!.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
