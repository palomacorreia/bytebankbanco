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
    await Future.delayed(Duration(seconds: 10));
    final Response response = await client.post(baseUrl,
        headers: {
          'Content-type': 'application/json',
          'password': password,
        },
        body: transactionJson);
    if (response.statusCode == 200) {
      return Transaction.fromJson(jsonDecode(response.body));
    }
    throw HttpException(_getMessage(response.statusCode));
  }
  String _getMessage(int statusCode) {
    if(_statusCodeResponses.containsKey(statusCode)){
      return _statusCodeResponses[statusCode];
    }
    return 'unknown error';
  }

  void _throwHttpError(int statusCode) =>
      throw HttpException(_statusCodeResponses[statusCode]);






  static final Map<int, String> _statusCodeResponses = {
    400: 'Erro ao realizar transação',
    401: 'Falha na Autenticação',
    409: 'Transação já Realizada',
  };
}

class HttpException implements Exception {
  final String message;

  HttpException(this.message);
}
