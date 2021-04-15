import 'package:flutter/material.dart';

class CategoryModel {
  final String title;
  final bool isAvailable;
  CategoryModel({this.title, this.isAvailable});
}

class Categories {
  static List<CategoryModel> data = [
    CategoryModel(title: "Filtros", isAvailable: true),
    CategoryModel(title: "Ensaladas", isAvailable: true),
    CategoryModel(title: "Combos", isAvailable: true),
    CategoryModel(title: "Promociones", isAvailable: true),
    CategoryModel(title: "Entradas", isAvailable: true),
    CategoryModel(title: "Postres", isAvailable: true),
    CategoryModel(title: "Bebidas", isAvailable: true)
  ];
}
