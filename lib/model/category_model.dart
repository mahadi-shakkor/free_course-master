class Category {
  final int id;
  final String categoryName;
  final String categoryImg;
  final String createdAt;
  final String updatedAt;

  Category({
    required this.id,
    required this.categoryName,
    required this.categoryImg,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0,
      categoryName: json['categoryName'] ?? '',
      categoryImg: json['categoryImg'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}
