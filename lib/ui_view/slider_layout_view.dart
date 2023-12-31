import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:second_onboarding/on_boarding_ui.dart';

import '../constants/constants.dart';
import '../widgets/slide_dots.dart';
import '../widgets/slide_items/slide_item.dart';

class SliderLayoutView extends StatefulWidget {
  const SliderLayoutView({super.key});

  @override
  State<StatefulWidget> createState() => _SliderLayoutViewState();
}

class _SliderLayoutViewState extends State<SliderLayoutView> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) => topSliderLayout();

  Widget topSliderLayout() {
    var slides = Configs.getInstance().slides;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: slides.length,
            itemBuilder: (ctx, i) => SlideItem(slides, i),
          ),
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: <Widget>[
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    if (kDebugMode) {
                      print(_currentPage);
                    }
                    if (_currentPage < slides.length - 1) {
                      _pageController.jumpToPage(_currentPage + 1);
                    } else {
                      Configs.getInstance().onFinish();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0, bottom: 15.0),
                    child: Text(
                      _currentPage + 1 == slides.length
                          ? Constants.finish
                          : Constants.next,
                      style: const TextStyle(
                        fontFamily: Constants.openSans,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: GestureDetector(
                  onTap: () {
                    Configs.getInstance().onFinish();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 15.0, bottom: 15.0),
                    child: Text(
                      Constants.skip,
                      style: TextStyle(
                        fontFamily: Constants.openSans,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: AlignmentDirectional.bottomCenter,
                margin: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int i = 0; i < slides.length; i++)
                      if (i == _currentPage)
                        const SlideDots(true)
                      else
                        const SlideDots(false)
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
