

import 'package:friend/vote/vote_provider.dart';
import 'package:get/get.dart';

import 'election.dart';

class VoteController extends GetxController with  StateMixin<Election>{

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
