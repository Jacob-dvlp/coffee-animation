// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:developer';

import 'package:coffe_animation/model/coffee.dart';
import 'package:coffe_animation/page/about_coffee/page_about.dart';
import 'package:flutter/material.dart';

class PageCoffee extends StatelessWidget {
  final PageController pageController;
  final PageController pageTextController;
  final Duration duration;
  final double currentPage;
  final double lowerLimit;
  final double upperLimit;
  final double valueSet;
  final int col;
  final size;
  final int row;
  const PageCoffee(
      {Key? key,
      required this.pageController,
      required this.pageTextController,
      required this.duration,
      required this.currentPage,
      required this.lowerLimit,
      required this.upperLimit,
      required this.valueSet,
      required this.col,
      required this.row,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.6,
      alignment: Alignment.bottomCenter,
      child: PageView.builder(
        controller: pageController,
        scrollDirection: Axis.vertical,
        itemCount: coffee.length + 1,
        onPageChanged: ((value) {
          if (value < coffee.length) {
            pageTextController.animateToPage(value,
                duration: duration, curve: Curves.easeOut);
          }
        }),
        itemBuilder: (context, index) {
          if (index == 0) {
            return const SizedBox.shrink();
          }
          final Coffee coffees = coffee[index - 1];
          final result = currentPage - index + 1;
          final value = -0.4 * result + 1;
          final opacity = value.clamp(lowerLimit, upperLimit);
          log(result.toString());
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PageAbout(
                  coffee: coffees,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Transform(
                alignment: Alignment.bottomCenter,
                transform: Matrix4.identity()
                  ..setEntry(
                    row,
                    col,
                    valueSet,
                  )
                  ..translate(0.0, size.height / 2.6 * (1 - value).abs())
                  ..scale(value),
                child: Opacity(
                  opacity: opacity,
                  child: Image.asset(
                    coffees.img!,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
