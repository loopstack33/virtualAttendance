import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_attendance/screens/welcome.dart';
import 'package:virtual_attendance/utils/color_constants.dart';
import 'package:virtual_attendance/utils/lottie_src.dart';

import 'login.dart';


class OnBoarding extends StatelessWidget {
  OnBoarding({Key? key}) : super(key: key);

  final introKey = GlobalKey<IntroductionScreenState>();

  _storeOnboardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  void _onIntroEnd(context) {
    _storeOnboardInfo();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const Welcome()),
    );
  }


  Widget _buildImage(String assetName, [double width = 350]) {
    return Lottie.asset(assetName, );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0,fontFamily: 'Open Sans',fontWeight: FontWeight.w300,color: primaryColorDark);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0,fontFamily: 'DM Sans', fontWeight: FontWeight.w700,color: primaryColorDark),
      bodyTextStyle: bodyStyle,
      pageColor: Colors.transparent,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,

      pages: [
        PageViewModel(
          title: "Use Geofence Location",
          body:
          "We provide you with peace of mind, giving up to the minute information on the location of your vehicle",
          image: _buildImage(geofence),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Employee Records",
          body:
          "We provide you variety of packages for your ease. Upgrade anytime.",
          image: _buildImage(employee),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Contact HR",
          body:
          "24/7 call center for your help. ",
          image: _buildImage(contact),
          decoration: pageDecoration,
        ),

      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text('Skip',style: TextStyle(color: primaryColorDark,fontFamily: 'Open Sans',fontWeight: FontWeight.bold),),
      next: const Icon(Icons.arrow_forward,color: primaryColorDark,),
      done: const Text('Done', style: TextStyle(color: primaryColorDark,fontFamily: 'Open Sans',fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,

      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeColor: primaryColorDark,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),

    );
  }
}
