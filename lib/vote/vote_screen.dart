import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:friend/vote/contestants.dart';
import 'package:friend/vote/vote_controller.dart';
import 'package:friend/vote/vote_item.dart';
import 'package:get/get.dart';

class VoteScreen extends StatefulWidget {
  const VoteScreen({Key? key}) : super(key: key);

  @override
  State<VoteScreen> createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {

  final VoteController controller = Get.find<VoteController>();
  ViewType _viewType = ViewType.grid;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // body: controller.obx((data)
      //     //data!.data.contestants.where((element) => element.position == 'Pa').length
      //   => GridView.builder(gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
      //    maxCrossAxisExtent: 200,
      //    childAspectRatio: 3 / 2,
      //    crossAxisSpacing: 20,
      //    mainAxisSpacing: 20),
      //    itemCount: data!.data.contestants.where((element) => element.position == 'Pa').length,
      //       itemBuilder:(context,index) {
      //     return VoteItem(contestants: data.data.contestants.where((element)
      //     => element.position== 'Pa').toList()[index]);
      //       }
      //
      //       ),
      // ),
      body: Column(

        children: [
          SizedBox(height: 100,),
          Center(
            child: IconButton(
              icon: Icon(
                  _viewType == ViewType.list ? Icons.grid_on : Icons.view_list),
              onPressed: () {
                if (_viewType == ViewType.list) {

                  _viewType = ViewType.grid;
                } else {
                  _viewType = ViewType.list;
                }
                setState(() {});
              },
            ),
          ),
          (_viewType == ViewType.grid)?Obx(() => SizedBox(
            height: 200,
            child: Stepper(
              type: StepperType.horizontal,
              steps: buildStep(),
              currentStep: controller.currentStep.value,
              onStepContinue: () {
                if (controller.currentStep.value == buildStep().length - 1) {
                  print("Send data to server");
                } else {
                  controller.currentStep.value++;
                }
              },
              onStepCancel: () {
                controller.currentStep.value == 0
                    ? null
                    : controller.currentStep.value--;
              },
              onStepTapped: (index) {
                controller.currentStep.value = index;
              },
              controlsBuilder: (context, ControlsDetails details) {
                return Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          child: Text(controller.currentStep.value==buildStep().length-1?"Submit":"Next"),
                          onPressed: details.onStepContinue,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      if(controller.currentStep.value!=0)
                        Expanded(
                          child: ElevatedButton(
                            child: Text("Previous"),
                            onPressed: details.onStepCancel,
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          )):Obx(() => SizedBox(
            height: 200,
            child: Stepper(
              type: StepperType.horizontal,
              steps: buildStep(),
              currentStep: controller.currentStep.value,
              onStepContinue: () {
                if (controller.currentStep.value == buildStep().length - 1) {
                  print("Send data to server");
                } else {
                  controller.currentStep.value++;
                }
              },
              onStepCancel: () {
                controller.currentStep.value == 0
                    ? null
                    : controller.currentStep.value--;
              },
              onStepTapped: (index) {
                controller.currentStep.value = index;
              },
              controlsBuilder: (context, ControlsDetails details) {
                return Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          child: Text(controller.currentStep.value==buildStep().length-1?"Submit":"Next"),
                          onPressed: details.onStepContinue,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      if(controller.currentStep.value!=0)
                        Expanded(
                          child: ElevatedButton(
                            child: Text("Previous"),
                            onPressed: details.onStepCancel,
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          )),
        ],
      ),
    );
  }

  List<Step> buildStep() {
    return [
      Step(
          title: Text('Personal'),
          content:  Container(
            height: 200.h,
            child: controller.obx((data)
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
          ),
          isActive: controller.currentStep.value >= 0,
          state: controller.currentStep.value>0?StepState.complete:StepState.indexed
      ),

      Step(
          title: Text('Business'),
          content: Container(
            height: 100,
            color: Colors.green,
          ),
          isActive: controller.currentStep.value >= 1,
          state: controller.currentStep.value > 1
              ? StepState.complete
              : StepState.indexed),

      Step(
          title: Text('Confirm'),
          content: Container(
            height: 100,
            color: Colors.deepPurpleAccent,
          ),
          isActive: controller.currentStep.value >= 2)
    ];
  }
}
enum ViewType { grid, list }
