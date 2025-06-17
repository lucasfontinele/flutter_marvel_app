class HeroModel {
  final int id;
  final String name;
  final String description;
  final String image;
  final String mainCharacteristics;

  HeroModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.mainCharacteristics,
  });

  factory HeroModel.fromJson(Map<String, dynamic> json) {
    return HeroModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      mainCharacteristics: json['main_characteristics'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'main_characteristics': mainCharacteristics,
    };
  }
}
