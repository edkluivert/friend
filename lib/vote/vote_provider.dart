import 'package:friend/vote/vote.dart';
import 'package:get/get.dart';


class VoteProvider extends GetConnect{

  final userToken = "token";


  Future<Vote> getVotes() async{

    final headers = {"Authorization": "Bearer $userToken"};
    var response = await get("https://thumbprint-api.herokuapp.com/api/v1/user/voted-contestants",headers: headers);
    if(response.status.hasError){
      return Future.error(response.statusText!);
    }else{
      return Vote.fromJson(response.body);
    }

  }


}