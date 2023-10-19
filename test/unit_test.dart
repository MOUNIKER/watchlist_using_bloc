// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:watchlist_using_bloc/contact_repository.dart';

void main() {
  test('fetching api data', () async {
    bool done = false;
    final fetch = await ContactRepository().getContacts(1, 33);
    if (fetch.isNotEmpty) {
      done = true;
    }
    expect(done, true);
  });
}
