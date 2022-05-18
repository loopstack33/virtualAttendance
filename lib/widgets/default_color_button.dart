// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';

import '../utils/color_constants.dart';

class DefaultColorButton extends StatelessWidget {
  String text;
  final Function() press;
   DefaultColorButton({Key? key,required this.text,required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 335,
        height: 50,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 12,
              color: black.withOpacity(0.25)
            )
          ],
          gradient: primaryDarkGradient,
          borderRadius: BorderRadius.circular(10)
        ),
        child:  Center(child: Text(text,style:const TextStyle(fontFamily: 'Open Sans',fontSize: 18,fontWeight: FontWeight.w600,color: white),)),
      ),
    );
  }
}
