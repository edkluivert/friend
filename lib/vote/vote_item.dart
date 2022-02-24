import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:friend/vote/vote.dart';

class VoteItem extends StatelessWidget{

  final Data data;

  const VoteItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width : 300.w,
      height : 100.h,
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text(data.contestant.name.toString(), style: const TextStyle(
            color: Colors.white,
            fontSize: 30
          ),)
        ],
      ),
    );
  }

}