import 'package:quotes_clean_architecture_flutter_app/data/model/quotes_model.dart';
import 'package:quotes_clean_architecture_flutter_app/data/repositories/quotes_repository.dart';
import 'package:quotes_clean_architecture_flutter_app/domain/entities/quotes_entity.dart'
as entity;

class GetRandomQuotesUseCase {
  final QuotesRepositoryImp quotesRepositoryImp;
  GetRandomQuotesUseCase({required this.quotesRepositoryImp});

  /// Fungsi ini untuk mendapatkan quotes anime random melalui `QuotesRepository`.
  ///
  /// Gunakan fungsi ini di Bloc / Cubit dan gunakan try catch untuk error handling.
  ///
  /// contoh :
  /// ```
  /// try{
  ///   QuotesEntity entity = await GetRandomQuotesUseCase().getRandomQuotes();
  /// }catch(e){
  ///   print(e.toString());
  /// }
  /// ```
  ///
  /// return `QuotesEntity` ketika berhasil dan throw `String` pesan error ketika gagal
  Future<entity.QuotesEntity> getRandomQuotes() async {
    QuotesModel data = await quotesRepositoryImp.getRandomQuotes();
    List<entity.Result> res = [];
    for (Result item in data.result ?? []) {
      res.add(entity.Result(
          anime: item.anime,
          character: item.character,
          english: item.english,
          id: item.id,
          indo: item.indo));
    }
    entity.QuotesEntity model =
    entity.QuotesEntity(sukses: data.sukses, result: res);
    return model;
  }
}