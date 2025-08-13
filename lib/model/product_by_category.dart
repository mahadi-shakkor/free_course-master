class CategoryModel {
  final int id;
  final String categoryName;
  final String categoryImg;

  CategoryModel({
    required this.id,
    required this.categoryName,
    required this.categoryImg,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      categoryName: json['categoryName'],
      categoryImg: json['categoryImg'],
    );
  }
}
