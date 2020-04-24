import 'dart:convert';

import 'package:bytebankbanco/models/transaction.dart';
import 'package:http/http.dart';

import '../webClient.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response =
        await client.get(baseUrl).timeout(Duration(seconds: 5));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(baseUrl,
        headers: {
          'Content-type': 'application/json',
          'password': password,
        },
        body: transactionJson);
    if (response.statusCode == 400) {
      throw Exception("Erro ao realizar Transferência!");
    }
    if (response.statusCode == 401) {
      throw Exception("Falha na Autenticação!");
    }

    return Transaction.fromJson(jsonDecode(response.body));
  }
}
