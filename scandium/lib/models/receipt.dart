import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:scandium/main.dart';
import 'package:scandium/models/category.dart';
import 'package:scandium/models/merchant.dart';

part 'receipt.g.dart';

@collection
class Receipt {
  Id id = Isar.autoIncrement;

  var category = IsarLink<Category>();

  var merchant = IsarLink<Merchant>();

  String? nif;

  String countryCode;

  DateTime date;

  String fullId;

  String actud;

  double tax;

  double cost;

  String qrcode;

  Receipt({
    this.nif,
    required this.countryCode,
    required this.date,
    required this.fullId,
    required this.actud,
    required this.tax,
    required this.cost,
    required this.qrcode,
  });

  Widget getCategoryWidget({bool small = false}) {
    Category? categoryToRender = category.value ?? getDefaultCategory();
    return Chip(
      avatar: small ? null : const Icon(Icons.sort),
      label: small ? const Icon(Icons.sort) : Text(categoryToRender.name),
      backgroundColor: categoryToRender.getColor(),
    );
  }

  Widget getCategoryWidgetSmall() {
    return getCategoryWidget(small: true);
  }

  String prettifyNif(String sourceNif) {
    if (sourceNif.length != 9) {
      return sourceNif;
    }
    return '${sourceNif.substring(0, 3)} ${sourceNif.substring(3, 6)} ${sourceNif.substring(6, 9)}';
  }

  String getMerchantNif() {
    return prettifyNif(merchant.value!.nif!);
  }

  String getBuyerNif() {
    return prettifyNif(nif ?? 'None');
  }

  Widget getMerchantNameWidget() {
    return merchant.value!.getMerchantNameWidget();
  }

  String getDateAsString() {
    return DateFormat.yMMMEd().format(date);
  }

  double getTaxPercent() {
    return (tax / cost) * 100;
  }

  static Receipt fromString(String input) {
    var values = <String, String>{};
    for (String part in input.split('*')) {
      List<String> field = part.split(':');
      values[field[0]] = field[1];
    }

    return Receipt(
      qrcode: input,
      nif: values['B'],
      countryCode: values['C']!,
      //category: values['D'],
      //N: values['E'],
      date: DateTime.parse(values['F']!),
      fullId: values['G']!,
      actud: values['H']!,
      tax: double.parse(values['N']!),
      cost: double.parse(values['O']!),
      //programCode: values['Q'],
      //programName: values['R'],
    )
      ..category.value = getDefaultCategory()
      ..merchant.value = getMerchantInfo(values['A']!, values['C']!);
  }
}
