
class Contestants {

  int id;
  int position_id;
  int election_id;
  String name;
  String position;
  String photo;
  String created_at;
  String updated_at;

	Contestants.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		position_id = map["position_id"],
		election_id = map["election_id"],
		name = map["name"],
		position = map["position"],
		photo = map["photo"],
		created_at = map["created_at"],
		updated_at = map["updated_at"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['position_id'] = position_id;
		data['election_id'] = election_id;
		data['name'] = name;
		data['position'] = position;
		data['photo'] = photo;
		data['created_at'] = created_at;
		data['updated_at'] = updated_at;
		return data;
	}
}
