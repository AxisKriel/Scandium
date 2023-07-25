import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scandium/models/category.dart';
import 'package:scandium/models/merchant.dart';
import 'package:scandium/models/receipt.dart';

import 'screens/wallet.dart';
import 'screens/scan.dart';
import 'screens/home.dart';

late final Directory appDir;
late final Isar db;

Future initDb() async {
  try {
    appDir = await getApplicationDocumentsDirectory();

    db = await Isar.open([
      CategorySchema,
      MerchantSchema,
      ReceiptSchema,
    ], directory: appDir.path);
  } catch (e) {}

  // DEFAULT CATEGORY: Unsorted
  final unsortedCategory = Category()
    ..id = 1
    ..name = 'Unsorted'
    ..colorInt = Colors.white.value;

  await db.writeTxn(() async {
    await db.categories.put(unsortedCategory);
  });
}

Category? getCategoryById(int id) {
  return db.categories.getSync(id);
}

Category getDefaultCategory() {
  return getCategoryById(1)!;
}

Merchant? getMerchantByNif(String nif) {
  return db.merchants.where().nifEqualTo(nif).findFirstSync();
}

Merchant getMerchantInfo(String nif, String country) {
  Merchant? merchant = getMerchantByNif(nif);
  merchant ??= (Merchant()
    ..nif = nif
    ..country = country);
  return merchant;
}

List<Receipt> getReceipts() {
  return db.receipts.where().findAllSync();
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ISAR
    initDb().then((value) => log('Db initiated.'));

    return MaterialApp(
      title: 'Scandium',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const BottomNavigationPage(title: 'SCANDIUM'),
    );
  }
}

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key, required this.title});

  final String title;
  //final List<Receipt> receipts = List.empty();

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _selectedPage = 0;
  final List _pages = [
    const HomePage(),
    const ScanPage(),
    const WalletPage(),
  ];
  final TextEditingController _textController = TextEditingController();

  _changeTab(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(_pages[_selectedPage].title)),
      ),
      body: _pages[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (index) => _changeTab(index),
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Scan',
            icon: Icon(Icons.qr_code_scanner),
          ),
          BottomNavigationBarItem(
            label: 'Wallet',
            icon: Icon(Icons.wallet),
          ),
        ],
      ),
      floatingActionButton: _selectedPage == 2
          ? FloatingActionButton.extended(
              label: const Text('Add Category'),
              icon: const Icon(Icons.new_label),
              tooltip: 'Add Category',
              //child: const Icon(Icons.new_label),
              onPressed: () {
                math.Random random = math.Random();
                int colorIndex = random.nextInt(Colors.primaries.length);
                Color randomColor = Colors.primaries[colorIndex];
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Category Name'),
                        content: TextField(
                          controller: _textController,
                          decoration: const InputDecoration(
                            hintText: 'Type something...',
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              var newCategory = Category()
                                ..name = _textController.text
                                ..colorInt = randomColor.value;
                              db.writeTxnSync(() {
                                db.categories.putSync(newCategory);
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        'Created category ${newCategory.name}.')));
                              });
                            },
                            child: const Text('Save'),
                          ),
                        ],
                      );
                    });
              })
          : null,
    );
  }
}
