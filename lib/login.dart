import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:friend/color.dart';

import 'auth_box.dart';

class Login extends StatefulWidget{
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    bool _autoValidate = false;
    final _formKey = GlobalKey<FormState>();
    bool _btnEnabled = false;

   return Scaffold(
     body : SafeArea(
       child: SingleChildScrollView(
         child: Column(
           children: [
             Stack(
               children: [
                Container(
                  width: 489.w,
                   height: 240.h,
                  decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/background.png',),
                          fit: BoxFit.fill
                      )
                  ),
                ),
                 Positioned(
                   top: 33.h,
                   left: 60.w,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/logo.svg', width: 19.w,height: 14.h,),
                            SizedBox(width: 9.w,),
                            SvgPicture.asset('assets/icons/friend.svg', width: 99.w,height: 14.h,),
                          ],
                        ),
                       SizedBox(height: 24.h,),
                       SizedBox(
                         width: 211.w,
                         height: 27.h,
                         child: Text('Connecting', style: TextStyle(
                           fontFamily: 'Sfpro',
                           fontSize: 24.sp,
                           fontWeight: FontWeight.w400,
                           color: Colors.white
                         ), ),
                       ),
                       SizedBox(
                         width: 211.w,
                         height: 60.h,
                         child: Text('Social Communities around the World', style: TextStyle(
                             fontFamily: 'Sfpro',
                             fontSize: 24.sp,
                             fontWeight: FontWeight.w600,
                             color: Colors.white
                         ), ),
                       )
                     ],
                   ),
                 ),

               ],
             ),
             SizedBox(height: 59.h,),
             Padding(
               padding: EdgeInsets.symmetric(horizontal: 48.w),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: EdgeInsets.only(left: 8.w),
                     child: Text('Login'.toUpperCase(), style: TextStyle(
                       fontFamily: 'Sfpro',
                       fontSize: 18.sp,
                       fontWeight: FontWeight.bold,
                       color: Colors.black
                     ), ),
                   ),
                   SizedBox(height: 40.h,) ,
                   Row(
                     children: [
                         AuthBox(
                           title:"Login with Google",
                           onClick :(){},
                           image:'assets/icons/google.svg',
                           textColor : 0xFFFE6F6F,
                           borderColor: 0xFFFE6F6F,
                         ),
                       SizedBox(width: 24.w ,),
                       AuthBox(
                         title:"Login with Facebook",
                         onClick :(){},
                         image:'assets/icons/facebook.svg',
                         textColor : 0xFF7A9BED,
                         borderColor: 0xFF7A9BED,
                       )
                     ],
                   ),
                   SizedBox(height: 55.h,),
                   Form(
                     key: _formKey,
                     onChanged: () =>
                         setState(() => _btnEnabled = _formKey.currentState!.validate()),
                     autovalidateMode: _autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                     child: Column(
                       children: [
                         buildEmailFormField(),
                         SizedBox(height: 17.h,),
                         buildPasswordFormField(),
                       ],
                     ),
                   ),
                   SizedBox(height: 24.h,),
                   SizedBox(
                     width: 294.w,
                     height: 54.h,
                     child: ElevatedButton(
                       onPressed: (){
                         //Get.to(()=>RegisterFinalScreen());
                       },
                       style:  ElevatedButton.styleFrom(
                         primary: primaryColor,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10.r), // <-- Radius
                         ),
                         textStyle: TextStyle(
                           fontFamily: 'Sfpro',
                           fontSize: 18.sp,
                           color: Colors.white,
                           fontWeight: FontWeight.w400,
                         ),
                       ),
                       child: const Text(
                         "Login",
                       ),
                     ),
                   ),
                   SizedBox(height: 25.h,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text("Don't have an account?", style: TextStyle(
                         fontFamily: 'Sfpro',
                         fontSize: 16.sp,
                         fontWeight: FontWeight.w400,
                         color: greyColor
                       ), ),
                       SizedBox(width: 1.w,),
                       Text('Signup', style: TextStyle(
                         fontFamily: 'Sfpro',
                         fontSize: 16.sp,
                         fontWeight: FontWeight.w400,
                         decoration: TextDecoration.underline,
                         color: purpleColor
                       ), ),

                     ],
                   ),
                   SizedBox(height: 30.h,)
                 ],
               ),
             ),

           ],
         ),
       ),
     )
   );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      //obscureText: true,
      keyboardType: TextInputType.phone,
      style: TextStyle(
        fontFamily: 'Sfpro',
        fontSize: 16.sp,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      //controller: _controller.passwordController,
      onSaved: (value) {
       // _controller.password = value!;
      },
      validator: (value) {
        //return _controller.validatePassword(value!);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: greyColor,
              width: 2.w
            )

        ),
        // labelText: "Confirm Password",
        focusColor: primaryColor,
        labelText: "Email",
        labelStyle: TextStyle(
          fontFamily: 'Sfpro',
          fontSize: 14.sp,
          color: primaryColor,
          fontWeight: FontWeight.w400,
        ),
        hintText: "Email",
        hintStyle: TextStyle(
          fontFamily: 'Sfpro',
          fontSize: 14.sp,
          color: greyColor,
          fontWeight: FontWeight.w400,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      //obscureText: true,
      keyboardType: TextInputType.phone,
      style: TextStyle(
        fontFamily: 'Sfpro',
        fontSize: 16.sp,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      //controller: _controller.passwordController,
      onSaved: (value) {
        // _controller.password = value!;
      },
      validator: (value) {
        //return _controller.validatePassword(value!);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
                color: greyColor,
                width: 2.w
            ),


        ),
        // labelText: "Confirm Password",
        focusColor: primaryColor,
        hintText: "Password",
        hintStyle: TextStyle(
          fontFamily: 'Sfpro',
          fontSize: 14.sp,
          color: greyColor,
          fontWeight: FontWeight.w400,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }
}