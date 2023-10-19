import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:watchlist_using_bloc/model/user_model.dart';

class ContactRepository {
  Future<List<UserModel>> getContacts(int startId, int endId) async {
    String url =
        'http://5e53a76a31b9970014cf7c8c.mockapi.io/msf/getContacts?start=$startId&end=$endId';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      final List<UserModel> contacts = (result as List)
          .map(
            (contactJson) {
              final id = int.parse(contactJson['id']);
              if (id >= startId && id <= endId) {
                return UserModel(
                  name: contactJson['name'],
                  contact: contactJson['Contacts'],
                );
              } else {
                return UserModel(name: '', contact: '');
              }
            },
          )
          .where((contacts) =>
              contacts.name.isNotEmpty && contacts.contact.isNotEmpty)
          .toList();
      return contacts;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
