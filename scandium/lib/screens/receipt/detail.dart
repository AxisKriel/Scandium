import 'dart:developer';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:scandium/main.dart';
import 'package:scandium/models/receipt.dart';
import 'package:scandium/screens/category/category_selector.dart';

class ReceiptDetailView extends StatelessWidget {
  final Receipt receipt;
  final bool edit;

  const ReceiptDetailView({required this.receipt, this.edit = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receipt.fullId),
      ),
      body: Center(
        child: Card(
          elevation: 0.0,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.euro),
                title: receipt.getMerchantNameWidget(),
                subtitle: Text(receipt.getDateAsString()),
                trailing: Text(
                  '€ ${receipt.cost}',
                  textScaleFactor: 2,
                  //style: TextStyle(fo),
                ),
              ),
              ListTile(
                minLeadingWidth: 90.0,
                leading: const Text('Category'),
                title: Row(
                  children: [
                    receipt.getCategoryWidget(),
                  ],
                ),
              ),
              ListTile(
                minLeadingWidth: 90.0,
                leading: const Text('Merchant NIF'),
                title: Text(receipt.getMerchantNif()),
              ),
              ListTile(
                minLeadingWidth: 90.0,
                leading: const Text('Cost'),
                title: Text(
                  '€ ${receipt.cost}',
                ),
                subtitle: Text(
                    'IVA: € ${receipt.tax} (~ ${receipt.getTaxPercent().truncate()}%)'),
              ),
              ListTile(
                minLeadingWidth: 90.0,
                leading: const Text('Receipt ID'),
                title: Text(
                  receipt.fullId!,
                  textScaleFactor: 0.8,
                ),
                subtitle: Text('ATCUD: ${receipt.actud}'),
              ),
              ListTile(
                minLeadingWidth: 90.0,
                leading: const Text('Buyer NIF'),
                title: Text(
                  receipt.getBuyerNif(),
                ),
              ),
              !edit
                  ? ListTile(
                      leading: const Icon(Icons.add),
                      title: const Text('ADD TO WALLET'),
                      enableFeedback: true,
                      onTap: () {
                        db.writeTxnSync(() {
                          db.receipts.putSync(receipt);
                        });
                        Navigator.pop(context);
                      },
                    )
                  : ListTile(
                      leading: const Icon(Icons.label),
                      title: const Text('CHANGE CATEGORY'),
                      iconColor: Colors.teal,
                      textColor: Colors.teal,
                      enableFeedback: true,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) =>
                                CategorySelector(receipt: receipt));
                      },
                    ),
              edit
                  ? ListTile(
                      leading: const Icon(Icons.delete),
                      title: const Text('DELETE RECEIPT'),
                      iconColor: Colors.red,
                      textColor: Colors.red,
                      enableFeedback: true,
                      onTap: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text('Delete this receipt?'),
                          action: SnackBarAction(
                            textColor: Colors.red,
                            label: 'DELETE',
                            onPressed: () {
                              db.writeTxnSync(
                                  () => db.receipts.deleteSync(receipt.id));
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();

                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Receipt deleted.')));
                              Navigator.pop(context);
                            },
                          ),
                        ));
                      })
                  : const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
