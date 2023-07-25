import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:scandium/screens/merchant/merchant_name.dart';

part 'merchant.g.dart';

@collection
class Merchant {
  Id id = Isar.autoIncrement;

  String? country;

  @Index()
  String? nif;

  String? name;

  Merchant();

  Widget getMerchantNameWidget() => MerchantName(merchant: this);
}
