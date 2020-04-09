import 'package:bytebankbanco/models/contact.dart';
import 'package:sqflite/sqflite.dart';

import '../app_database.dart';

class ContactDao{
  static const String tableSql ='CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_account INTEGER)';
  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _account = 'account_number';

  Future<int> save(Contact contact) async{
    final Database db = await getDatabase();
    final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contact.name;
    contactMap[_account] = contact.accountNumber;
    return db.insert('$_tableName', contactMap);

//  return createDatabase().then((db) {
//    final Map<String, dynamic> contactMap = Map();
//    contactMap['name'] = contact.name;
//    contactMap['account_number'] = contact.accountNumber;
//    return db.insert('contacts', contactMap);
//  });
  }

  Future<List<Contact>> findAll() async{
    final Database db = await getDatabase();
    final List<Map<String,dynamic>> result = await db.query('$_tableName');
    final List<Contact> contacts = List();
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row[_id],
        row[_name],
        row[_account],
      );
      contacts.add(contact);
    }
    return contacts;
    // return createDatabase().then((db) {
//    return db.query('contacts').then((maps) {
//      final List<Contact> contacts = List();
//      for (Map<String, dynamic> map in maps) {
//        final Contact contact = Contact(
//          map['id'],
//          map['name'],
//          map['account_number'],
//        );
//        contacts.add(contact);
//      }
//      return contacts;
  //});
//});
}
}