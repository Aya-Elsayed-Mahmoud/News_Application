
import 'dart:ui';

class CategoryModel {
  final String title;
  final String image;
  final Color color;


  CategoryModel({required this.title, required this.image, required this.color});
  static const List<CategoryModel> categories = [];
}
