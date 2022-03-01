import 'package:friend/vote/election.dart';


import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';


class VoteProvider extends GetConnect{

  final userToken = "4|5pKsM2fAA05oQaCPxDDiIL2CU9CsEFsyJHQQ4vRE";


  Future<Election> getVotes() async{

    final headers = {'Authorization': 'Bearer $userToken',
    'Accept': 'application/json'
    };

    var response = await get("http://64.227.102.13/api/v1/user/5/available-election-positions",
    headers: headers
    );

    // var response = await post("https://thumbprint-api.herokuapp.com/api/v1/user/7/available-election-positions",
    //    query,headers: headers);

    if(response.status.hasError){
      print('failed');
      return Future.error(response.statusText!);
    }else{
      print("works ${response.body}");
      return Election.fromJsonMap(response.body);

    }

  }


}