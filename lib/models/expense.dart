import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

String uuid = const Uuid().v4();
final formatter = DateFormat.yMd();

enum Category { food, travel, lesiure, work }

const categoryIcons = {
  Category.food: Icons.food_bank,
  Category.travel: Icons.car_rental,
  Category.lesiure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.dateTime,
    required this.category,
  }) : id = uuid;

  String id;
  String title;
  double amount;
  DateTime dateTime;
  Category category;

  String get formattedDateTime {
    return formatter.format(dateTime);
  }
}
