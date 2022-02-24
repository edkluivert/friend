

import 'dart:convert';

Vote voteFromJson(String str) => Vote.fromJson(json.decode(str));

String voteToJson(Vote data) => json.encode(data.toJson());
class Vote {

  Vote(
      this.status,
      this.message,
      this.data,
      );

      String status;
      String message;
      List<Data> data;

      factory Vote.fromJson(Map<String, dynamic> json) => Vote(
        json["status"],
        json["message"],
        List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

      Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };



}

class Data {

  Data(
   this.contestant,
      this.id,
      this.createdAt,
      this.electionContestantId,
      this.electionId,
      this.updatedAt,
      this.voteCaster
      );

      int id;
      int electionId;
      int electionContestantId;
      int voteCaster;
      String createdAt;
      String updatedAt;
      Contestant contestant;

      factory Data.fromJson(Map<String, dynamic> json) => Data(
        json["id"],
        json["electionId"],
        json["electionContestantId"],
        json["voteCaster"],
        json["createdAt"],
        json["updatedAt"],
        json["contestant"],

      );

      Map<String, dynamic> toJson() => {
        "id": id,
        "electionId": electionId,
        "electionContestantId":electionContestantId,
        "voteCaster":voteCaster,
       "createdAt":createdAt,
        "updatedAt":updatedAt,
        "contestant":contestant,

      };


}

class Contestant {

      int id;
      int positionId;
      int electionId;
      String name;
      String position;
      String photo;
      String createdAt;
      String updatedAt;

      Contestant(
          this.updatedAt,
          this.createdAt,
          this.electionId,
          this.id, this.name,
          this.position, this.photo, this.positionId
          );


      factory Contestant.fromJson(Map<String, dynamic> json) => Contestant(
        json["id"],
        json["electionId"],
        json["photo"],
        json["position"],
        json["createdAt"],
        json["updatedAt"],
        json["positionId"],
        json["name"],

      );

      Map<String, dynamic> toJson() => {
        "id": id,
        "electionId": electionId,
        "photo":photo,
        "name":name,
        "createdAt":createdAt,
        "updatedAt":updatedAt,
        "positionId":positionId,

      };


}