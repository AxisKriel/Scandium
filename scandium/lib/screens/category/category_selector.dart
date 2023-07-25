import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:scandium/main.dart';
import 'package:scandium/models/category.dart';
import 'package:scandium/models/receipt.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({super.key, required this.receipt});

  final Receipt receipt;

  @override
  Widget build(BuildContext context) {
    List<Category> categories = db.categories.where().findAllSync();
    return AlertDialog(
        title: Text('Change Category'),
        content: ListView.builder(
          shrinkWrap: true,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            Category cat = categories[index];
            return ActionChip(
              label: Text(cat.name),
              backgroundColor: Color(cat.colorInt),
              onPressed: () {
                receipt.category.value = cat;
                db.writeTxnSync(() {
                  db.receipts.putSync(receipt);
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();

                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Changed receipt category.')));
                  Navigator.pop(context);
                  Navigator.pop(context);
                });
              },
            );
          },
        ));
  }
}
