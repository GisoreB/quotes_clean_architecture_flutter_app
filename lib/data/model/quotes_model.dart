class QuotesModel {
  bool? sukses;
  List<Result>? result;

  QuotesModel({this.sukses, this.result});

  QuotesModel.fromJson(Map<String, dynamic> json) {
    sukses = json['sukses'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sukses'] = sukses;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int? id;
  String? english;
  String? indo;
  String? character;
  String? anime;

  Result({this.id, this.english, this.indo, this.character, this.anime});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    english = json['english'];
    indo = json['indo'];
    character = json['character'];
    anime = json['anime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['english'] = english;
    data['indo'] = indo;
    data['character'] = character;
    data['anime'] = anime;
    return data;
  }
}