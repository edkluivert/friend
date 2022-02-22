

class Vote {
  Vote({
      String? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  Vote.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _status;
  String? _message;
  List<Data>? _data;

  String? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      int? id, 
      int? electionId, 
      int? electionContestantId, 
      int? voteCaster, 
      String? createdAt, 
      String? updatedAt, 
      Contestant? contestant,}){
    _id = id;
    _electionId = electionId;
    _electionContestantId = electionContestantId;
    _voteCaster = voteCaster;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _contestant = contestant;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _electionId = json['election_id'];
    _electionContestantId = json['election_contestant_id'];
    _voteCaster = json['vote_caster'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _contestant = json['contestant'] != null ? Contestant.fromJson(json['contestant']) : null;
  }
  int? _id;
  int? _electionId;
  int? _electionContestantId;
  int? _voteCaster;
  String? _createdAt;
  String? _updatedAt;
  Contestant? _contestant;

  int? get id => _id;
  int? get electionId => _electionId;
  int? get electionContestantId => _electionContestantId;
  int? get voteCaster => _voteCaster;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Contestant? get contestant => _contestant;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['election_id'] = _electionId;
    map['election_contestant_id'] = _electionContestantId;
    map['vote_caster'] = _voteCaster;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_contestant != null) {
      map['contestant'] = _contestant?.toJson();
    }
    return map;
  }

}

/// id : 1
/// position_id : 4
/// election_id : 7
/// name : "Tino"
/// position : "Vice president"
/// photo : "http://127.0.0.1:8000/storage/contestantPhotos/Screenshot-2021-06-15-at-7.25.01-PM_1624377494.png"
/// created_at : "2021-06-22T15:58:14.000000Z"
/// updated_at : "2021-06-22T15:58:14.000000Z"

class Contestant {
  Contestant({
      int? id, 
      int? positionId, 
      int? electionId, 
      String? name, 
      String? position, 
      String? photo, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _positionId = positionId;
    _electionId = electionId;
    _name = name;
    _position = position;
    _photo = photo;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Contestant.fromJson(dynamic json) {
    _id = json['id'];
    _positionId = json['position_id'];
    _electionId = json['election_id'];
    _name = json['name'];
    _position = json['position'];
    _photo = json['photo'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _positionId;
  int? _electionId;
  String? _name;
  String? _position;
  String? _photo;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  int? get positionId => _positionId;
  int? get electionId => _electionId;
  String? get name => _name;
  String? get position => _position;
  String? get photo => _photo;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['position_id'] = _positionId;
    map['election_id'] = _electionId;
    map['name'] = _name;
    map['position'] = _position;
    map['photo'] = _photo;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}