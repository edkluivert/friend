import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthBox extends StatefulWidget{

  String image;
  String title;
  Function onClick;
  int borderColor;
  int textColor;

  AuthBox({Key? key, required this.title,required this.textColor, required this.image, required this.onClick, required this.borderColor}) : super(key: key);

  @override
  State<AuthBox> createState() => _AuthBoxState();
}

class _AuthBoxState extends State<AuthBox> {
  @override
  Widget build(BuildContext context) {
     return GestureDetector(
       onTap: widget.onClick(),
       child: Container(
         width: 135.w,
         height: 60.h,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10.r),
           border: Border.all(
             color: Color(widget.borderColor),
             width: 1.w,
           )
         ),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             SvgPicture.asset(widget.image,width: 20.w,height: 20.h, ),
             SizedBox(width: 14.w,),
             SizedBox(
               width: 61.w,
               height: 32.h,
               child: Text(widget.title, style: TextStyle(
                 fontFamily: 'Sfpro',
                 fontSize: 14.sp,
                 color: Color(widget.textColor),
                 fontWeight: FontWeight.w400,
               ), ),
             ),
           ],
         ),
       ),
     );
  }
}