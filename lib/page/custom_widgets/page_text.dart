// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:coffe_animation/model/coffee.dart';
import 'package:flutter/material.dart';

class PageText extends StatelessWidget {
  final PageController pageTextController;
  final coffee;
  final double currenteText;
  final double lowerLimit;
  final double upperLimit;
  final Duration duration;
  final double currentPage;

  const PageText(
      {Key? key,
      required this.pageTextController,
      required this.coffee,
      required this.currenteText,
      required this.lowerLimit,
      required this.upperLimit,
      required this.duration,
      required this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: PageView.builder(
          controller: pageTextController,
          itemCount: coffee.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final Coffee coffeer = coffee[index];
            final opacity = (1 - (index - currenteText).abs())
                .clamp(lowerLimit, upperLimit);
            return Center(
              child: Opacity(
                  opacity: opacity,
                  child: Text(
                    coffeer.name!,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            );
          },
        )),
        AnimatedSwitcher(
          duration: duration,
          child: Text(
            '\$${coffee[currentPage.toInt()].price!.toStringAsFixed(2)}',
            key: Key(coffee[currentPage.toInt()].name!),
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
