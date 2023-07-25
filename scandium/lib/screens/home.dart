import 'dart:io';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:scandium/main.dart';
import 'package:scandium/models/category.dart';
import 'package:scandium/models/receipt.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  final String title = 'Home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int receiptCount = 0;
    List<Category> categories = List.empty();
    try {
      categories = db.categories.where().findAllSync();
      receiptCount = db.receipts.countSync();
    } catch (e) {}

    return receiptCount < 1
        ? const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Nothing to see here yet...'),
                SizedBox(height: 15.0),
                Icon(Icons.pie_chart),
                SizedBox(height: 15.0),
                Text('Tap [Scan] to start collecting!')
              ],
            ),
          )
        : ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              var cat = categories[index];
              return ListTile(
                leading: Icon(Icons.sort),
                tileColor: cat.getColor(),
                title: Text(cat.name),
                trailing: Text(db.receipts
                    .filter()
                    .category((q) => q.idEqualTo(cat.id))
                    .countSync()
                    .toString()),
              );
            },
          );
  }
}
