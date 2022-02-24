import 'package:friend/vote/vote.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';


class VoteProvider extends GetConnect{

  final userToken = "262|ZSOVG5VKwlO1ZGVsqYSuh3O77Uhggw3vFPZVLyic";


  Future<List<dynamic>> getVotes() async{

    final headers = {'Authorization': 'Bearer $userToken'};
    var response = await get("https://thumbprint-api.herokuapp.com/api/v1/user/7/available-election-positions",
    headers: headers
    );
    if(response.status.hasError){
      return Future.error(response.statusText!);
    }else{
      print("works ${response.body}");
      return response.body;
    }

  }


}