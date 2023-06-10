import 'package:flutter/cupertino.dart';
import '../../constants/constants.dart';
import 'package:second_onboarding/model/slider.dart';

class SlideItem extends StatelessWidget {
  final List<SliderModel> slides;

  final int index;

  const SlideItem(this.slides, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                slides[index].sliderImageUrl,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 60.0,
        ),
        Text(
          slides[index].sliderHeading,
          style: const TextStyle(
            fontFamily: Constants.poppins,
            fontWeight: FontWeight.w700,
            fontSize: 20.5,
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              slides[index].sliderSubHeading,
              style: const TextStyle(
                fontFamily: Constants.openSans,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.5,
                fontSize: 12.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
