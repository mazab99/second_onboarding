import 'package:flutter/material.dart';

import 'on_boarding_ui.dart';
import 'package:second_onboarding/model/slider.dart' as SliderModel;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: OnBoardingUi(
          slides: [
            SliderModel.SliderModel(
              sliderHeading: "Slide 1",
              sliderSubHeading: "Slide Sub Heading 1",
              sliderImageUrl: 'assets/1.jpg',
            ),
            SliderModel.SliderModel(
              sliderHeading: "Slide 1",
              sliderSubHeading: "Slide Sub Heading 1",
              sliderImageUrl: 'assets/4.jpg',
            ),
            SliderModel.SliderModel(
              sliderHeading: "Slide 1",
              sliderSubHeading: "Slide Sub Heading 1",
              sliderImageUrl: 'assets/5.jpg',
            )
          ],
          onFinish: () {
            // Your OnFinish code here
          },
        ),
      ),
    );
  }
}
