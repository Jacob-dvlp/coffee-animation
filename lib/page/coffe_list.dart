import 'package:coffe_animation/model/coffee.dart';
import 'package:coffe_animation/page/custom_widgets/page_coffee.dart';
import 'package:coffe_animation/page/custom_widgets/page_text.dart';
import 'package:flutter/material.dart';

class CoffeList extends StatefulWidget {
  const CoffeList({Key? key}) : super(key: key);

  @override
  State<CoffeList> createState() => _CoffeListState();
}

class _CoffeListState extends State<CoffeList> {
  final pageController = PageController(viewportFraction: 0.35);
  final pageTextController = PageController();
  double currentPage = 0.0;
  int row = 3;
  int col = 2;
  double lowerLimit = 0.0;
  double upperLimit = 1.0;
  double valueSet = 0.001;
  final duration = const Duration(milliseconds: 500);

  void coffeScroList() => setState(() {
        currentPage = pageController.page!;
      });

  void textScroController() => currentPage;

  @override
  void initState() {
    pageController.addListener(coffeScroList);
    pageTextController.addListener(textScroController);
    super.initState();
  }

  @override
  void dispose() {
    pageController.removeListener(coffeScroList);
    pageTextController.removeListener(textScroController);
    pageController.dispose();
    pageTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Positioned(
              left: 20,
              right: 20,
              bottom: -size.height * 0.22,
              height: size.height * 0.3,
              child: const DecoratedBox(
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                    color: Colors.brown,
                    blurRadius: 90,
                    offset: Offset.zero,
                    spreadRadius: 45,
                  )
                ]),
              )),
          PageCoffee(
              pageController: pageController,
              pageTextController: pageTextController,
              duration: duration,
              currentPage: currentPage,
              lowerLimit: lowerLimit,
              upperLimit: upperLimit,
              valueSet: valueSet,
              col: col,
              row: row,
              size: size),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: 100,
            child: PageText(
              pageTextController: pageTextController,
              coffee: coffee,
              currenteText: currentPage,
              lowerLimit: lowerLimit,
              upperLimit: upperLimit,
              duration: duration,
              currentPage: currentPage,
            ),
          ),
        ],
      ),
    );
  }
}
