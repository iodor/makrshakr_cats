class CatFactModel {
  String? fact;
  int? length;

  CatFactModel({this.fact, this.length});

  CatFactModel.fromJson(Map<String, dynamic> json) {
    fact = json['fact'] as String;
    length = json['length'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fact'] = this.fact;
    data['length'] = this.length;
    return data;
  }
}