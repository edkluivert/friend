import 'package:flutter/material.dart';
import 'package:friend/vote/contestants.dart';
import 'package:friend/vote/vote_controller.dart';
import 'package:friend/vote/vote_item.dart';
import 'package:get/get.dart';

class VoteScreen extends GetView<VoteController> {
  const VoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx((data)
          //data!.data.contestants.where((element) => element.position == 'Pa').length
        => GridView.builder(gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
         maxCrossAxisExtent: 200,
         childAspectRatio: 3 / 2,
         crossAxisSpacing: 20,
         mainAxisSpacing: 20),
         itemCount: data!.data.contestants.where((element) => element.position == 'Pa').length,
            itemBuilder:(context,index) {
          return VoteItem(contestants: data.data.contestants.where((element)
          => element.position== 'Pa').toList()[index]);
            }

            ),
      ),
    );
  }
}
