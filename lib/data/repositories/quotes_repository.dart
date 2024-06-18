import 'dart:convert';

import 'package:quotes_clean_architecture_flutter_app/data/model/quotes_model.dart';
import 'package:quotes_clean_architecture_flutter_app/utils/helper.dart';
import 'package:http/http.dart' as http;

abstract class QuotesRepository {
  Future<QuotesModel> getRandomQuotes();
}

class QuotesRepositoryImp implements QuotesRepository {
  final http.Client client;
  QuotesRepositoryImp(this.client);

  /// Fungsi untuk mendapatkan quotes anime secara random. Gunakan fungsi ini di usecase Anda
  ///
  /// return `QuotesModel` ketika berhasil dan throw `String` pesan error ketika gagal
  @override
  Future<QuotesModel> getRandomQuotes() async {
    var response = await client.get(
        Uri.parse("https://katanime.vercel.app/api/getrandom"),
        headers: {'accept': 'application/json'});
    if (response.statusCode != 200) {
      throw (Helper.generateResponse(response));
    }

    return QuotesModel.fromJson(jsonDecode(response.body));
  }
}