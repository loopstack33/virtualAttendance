import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Image.asset(vr,width: 200,),
              const SizedBox(height: 50,),
              Padding(
                padding:const  EdgeInsets.only(left: 20.0,right: 20.0),
                child: Column(
                  children: [
                    const  Text("Login",style: TextStyle(fontFamily: 'DM Sans',fontWeight: FontWeight.bold,fontSize: 30,color: primaryColorDark),),
                const SizedBox(height: 20,),
                    DefaultTextField(controller: email,text: "Email",),
                    const SizedBox(height: 20,),
                    DefaultTextField(controller: pass,text: 'Password',),
                    const SizedBox(height: 20,),
                    Column(
                      children: [
                        DefaultColorButton(text: "Login", press: (){
                        }),
                        const SizedBox(height: 20,),

                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Image.asset(
                ustiLogo,
                width: 301,
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
