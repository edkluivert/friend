import 'package:friend/vote/contestants.dart';

class Data {

  List<String> positions;
  List<Contestants> contestants;

	Data.fromJsonMap(Map<String, dynamic> map): 
		positions = List<String>.from(map["positions"]),
		contestants = List<Contestants>.from(map["contestants"].map((it) => Contestants.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['positions'] = positions;
		data['contestants'] = contestants != null ? 
			this.contestants.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
