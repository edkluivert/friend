import 'package:friend/vote/vote_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings{
  @override
  void dependencies() {
   Get.put(VoteController(), permanent: true);
  }

}