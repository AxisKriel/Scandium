import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

part 'category.g.dart';

@Collection(accessor: 'categories')
class Category {
  Id id = Isar.autoIncrement;

  late String name;

  late int colorInt;

  Category();

  Color getColor() {
    return Color(colorInt);
  }
}
