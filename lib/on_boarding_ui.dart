import 'package:flutter/material.dart';
import 'package:second_onboarding/model/slider.dart';
import 'package:second_onboarding/ui_view/slider_layout_view.dart';

class OnBoardingUi extends StatelessWidget {
  final List<SliderModel> slides;
  final Function onFinish;

  const OnBoardingUi({
    super.key,
    required this.slides,
    required this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    Configs.getInstance(slides: slides, onFinish: onFinish);

    return Theme(
      data: ThemeData(
        primarySwatch: Colors.blue,
        platform: TargetPlatform.iOS,
      ),
      child: const SliderLayoutView(),
    );
  }
}

class Configs {
  static Configs? _instance;
  final List<SliderModel> slides;
  final Function onFinish;

  Configs(this.slides, this.onFinish);

  static Configs getInstance(
      {List<SliderModel>? slides, Function? onFinish}) {
    _instance ??= Configs(slides!, onFinish!);

    return _instance!;
  }
}
