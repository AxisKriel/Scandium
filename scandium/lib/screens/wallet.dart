import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:scandium/main.dart';
import 'package:scandium/models/receipt.dart';
import 'package:scandium/screens/receipt/detail.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  final String title = 'Wallet';

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  List<Receipt> receipts = List.empty();

  void fetchReceipts() {
    receipts = db.receipts.where().sortByDateDesc().findAllSync();
  }

  @override
  void initState() {
    super.initState();
    fetchReceipts();
  }

  @override
  Widget build(BuildContext context) {
    fetchReceipts();
    if (receipts.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nothing to see here yet...'),
            SizedBox(height: 15.0),
            Icon(Icons.wallet),
            SizedBox(height: 15.0),
            Text('Tap [Scan] to start collecting!')
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: receipts.length,
      itemBuilder: (context, index) {
        Receipt receipt = receipts[index];

        return Dismissible(
          key: Key(receipt.id.toString()),
          background: Container(
            color: Colors.red,
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.delete, color: Colors.white),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text('Delete', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
          child: ListTile(
            leading: receipt.getCategoryWidgetSmall(),
            title: receipt.getMerchantNameWidget(),
            subtitle: Text(receipt.getDateAsString()),
            trailing: Text(
              '€ ${receipt.cost}',
              textScaleFactor: 2,
              //style: TextStyle(fo),
            ),
            isThreeLine: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ReceiptDetailView(receipt: receipt, edit: true),
                ),
              ).then(
                (value) {
                  setState(() {
                    fetchReceipts();
                  });
                },
              );
            },
          ),
          onDismissed: (direction) {
            db.writeTxnSync(() {
              db.receipts.deleteSync(receipt.id);
            });
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Receipt deleted.')));
          },
        );
      },
    );
  }
}
