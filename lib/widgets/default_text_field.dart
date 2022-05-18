import 'package:flutter/material.dart';

import '../utils/color_constants.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  const DefaultTextField({Key? key,required this.controller,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 50,
      decoration: BoxDecoration(
        color: white,
        border: Border.all(color: greyLightShade,width: 1),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: black.withOpacity(0.25)
          )
        ],
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(
            fontSize: 16,
            color: bbColor,
            fontFamily: 'Open Sans',
            fontWeight: FontWeight.w300),
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          hintText:text,
          hintStyle:const TextStyle(
              fontSize: 16,
              color: bbColor,
              fontFamily: 'Open Sans'),
          fillColor: const Color(0xFFFFFFFF),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide:const BorderSide(
              color: white,
              width: 1.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide:const BorderSide(
              color: Colors.red,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
