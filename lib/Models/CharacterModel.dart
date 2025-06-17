class CharacterModel {
  final int id;
  final String name;
  final String description;
  final String image;
  final String main_characteristics;

  CharacterModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.main_characteristics,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? '',
      image: '${json['image']['path']}.${json['image']['extension']}',
      main_characteristics: json['main_characteristics'] ?? '',
    );
  }
}
