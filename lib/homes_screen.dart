import 'package:flutter/material.dart';
import 'package:watchlist_using_bloc/contact_list_page.dart';
import 'package:watchlist_using_bloc/string/string_names.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(StringNames().textOne()),
            titleTextStyle: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
            bottom: const TabBar(labelColor: Colors.black, tabs: [
              Tab(text: 'Contact1'),
              Tab(text: 'Contact2'),
              Tab(text: 'Contact3'),
            ]),
          ),
          body: const TabBarView(children: [
            ContactListPage(startId: 1, endId: 33),
            ContactListPage(startId: 34, endId: 66),
            ContactListPage(startId: 67, endId: 100)
          ]),
        ),
      ),
    );
  }
}
