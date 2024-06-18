class QuotesEntity {
  bool? sukses;
  List<Result>? result;

  QuotesEntity({this.sukses, this.result});
}

class Result {
  int? id;
  String? english;
  String? indo;
  String? character;
  String? anime;
  Result({this.id, this.english, this.indo, this.character, this.anime});
}