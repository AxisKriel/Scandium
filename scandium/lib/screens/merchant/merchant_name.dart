import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:isar/isar.dart';
import 'package:scandium/main.dart';
import 'package:scandium/models/merchant.dart';

class MerchantName extends StatefulWidget {
  const MerchantName({super.key, required this.merchant});

  final Merchant merchant;

  @override
  State<MerchantName> createState() => _MerchantNameState();
}

class _MerchantNameState extends State<MerchantName> {
  Future<String> fetchMerchantData() async {
    if (widget.merchant.name != null) {
      return widget.merchant.name!;
    }

    Merchant? existingMerchant =
        await db.merchants.where().nifEqualTo(widget.merchant.nif).findFirst();
    if (existingMerchant?.name != null) {
      widget.merchant.name = existingMerchant!.name;
      return widget.merchant.name!;
    }

    final url =
        'https://ec.europa.eu/taxation_customs/vies/rest-api/ms/${widget.merchant.country}/vat/${widget.merchant.nif}';
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        widget.merchant.name = data['name'];
        return data['name'];
      } else {
        return 'Error Fetching Merchant Name!';
      }
    } catch (e) {
      log(e.toString());
    }
    return widget.merchant.nif!;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: fetchMerchantData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(
              snapshot.data!,
              maxLines: 2,
            );
          } else {
            return const Text('Fetching...');
          }
        });
  }
}
