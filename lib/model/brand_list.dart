class BrandList {
  final int id;
  final String brandName;
  final String brandImg;

  BrandList({
    required this.id,
    required this.brandName,
    required this.brandImg,
  });

  factory BrandList.fromJson(Map<String, dynamic> json) {
    return BrandList(
      id: json['id'] ?? 0,
      brandName: json['brandName'] ?? '',
      brandImg: json['brandImg'] ?? '',
    );
  }
}
