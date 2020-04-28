import 'package:bytebankbanco/models/transaction.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Retornar valor,quando criamos transação", () {
    final transaction = Transaction(null, 200, null);
    expect(transaction.value, 200);
  });

  test("Retornar erro quando a transação tem valor menor que zero", () {
    expect(() => Transaction(null, 0, null), throwsAssertionError);
  });
}
