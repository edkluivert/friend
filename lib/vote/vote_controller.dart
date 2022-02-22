import 'package:friend/vote/vote.dart';
import 'package:friend/vote/vote_provider.dart';
import 'package:get/get.dart';

class VoteController extends GetxController with  StateMixin<Vote>{

  final VoteProvider voteProvider = VoteProvider();

  @override
  void onInit() {
    super.onInit();
    voteProvider.getVotes().then((value) {
      change(value, status: RxStatus.success());
    },onError: (error){
      change(null,status: RxStatus.error(error.toString()));
    });

  }

}
