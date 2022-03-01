import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'contestants.dart';



class VoteItem extends StatelessWidget{

  final Contestants contestants;

  const VoteItem({Key? key, required this.contestants}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width : 300.w,
      height : 100.h,
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text(contestants.name, style: const TextStyle(
            color: Colors.white,
            fontSize: 30
          ),)
        ],
      ),
    );
  }

}

