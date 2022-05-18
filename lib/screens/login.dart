import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_attendance/utils/color_constants.dart';
import 'package:virtual_attendance/utils/image_src.dart';
import 'package:virtual_attendance/widgets/default_color_button.dart';
import 'package:virtual_attendance/widgets/default_text_field.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();
  bool isBioLogin = false;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
               SizedBox(height: 20.h,),
              Image.asset(vr,width: 200.w,),
               SizedBox(height: 50.h,),
              Padding(
                padding:const  EdgeInsets.only(left: 20.0,right: 20.0),
                child: Column(
                  children: [
                Text("Login",style: TextStyle(fontFamily: 'DM Sans',fontWeight: FontWeight.bold,fontSize: 30.sp,color: primaryColorDark),),
                   SizedBox(height: 20.h,),
                    DefaultTextField(controller: email,text: "Email",),
                     SizedBox(height: 20.h,),
                    DefaultTextField(controller: pass,text: 'Password',),
                     SizedBox(height: 20.h,),
                    Column(
                      children: [
                        DefaultColorButton(text: "Login", press: (){
                        }),
                         SizedBox(height: 10.h,),

                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildRememberMeCheckbox(),
                    _buildBiologin(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Forget Password?",style: TextStyle(fontFamily: 'Open Sans',fontWeight: FontWeight.bold,fontSize: 14.sp,color: primaryColorDark),),
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Don’t have an Account? ",
                      style: TextStyle(fontFamily: 'Open Sans',fontWeight: FontWeight.w500,fontSize: 16.sp,color: greyShade),
                    ),
                    TextSpan(
                        text: "Register",
                        style: TextStyle(fontFamily: 'Open Sans',fontWeight: FontWeight.bold,fontSize: 16.sp,color: primaryColorDark),
                    ),
                  ]
                )
              ),
              const Spacer(),
              Image.asset(
                ustiLogo,
                width: 301.w,
                height: 32.h,
              ),
              SizedBox(height: 10.h,)
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildRememberMeCheckbox() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Theme(
          data: ThemeData(unselectedWidgetColor: greyShade),
          child: Checkbox(
              value: _rememberMe,
              checkColor: white,
              activeColor: primaryColorDark,
              onChanged: _handleRemeberme),
        ),
        Text(
          'Remember Me!',
          style: TextStyle(
              fontSize: 14.sp, color: greyShade, fontFamily: 'Open Sans'),
        ),
      ],
    );
  }

  Widget _buildBiologin() {
    return Row(
      //  mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Transform.scale(
          scale: 0.8,
          child: CupertinoSwitch(
              activeColor: primaryColorDark,
              value: isBioLogin,
              onChanged:_handleBioLogin ),
        ),
        Text(
          "BioLogin",
          style: TextStyle(
              fontSize: 14.sp, fontWeight: FontWeight.w500,color: primaryColorDark, fontFamily: 'Open Sans'),
        )
      ],
    );
  }
  void _handleBioLogin(bool? value2) {

    setState(() {
      isBioLogin = value2!;
    });
  }

  //handle remember me function
  void _handleRemeberme(bool? value1) {


    setState(() {
      _rememberMe = value1!;
    });
  }
}
