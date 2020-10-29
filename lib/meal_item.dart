class MealItem{
  static String table = "quizzes";


  int id;
  String name;
  String category;
  String area;
  String instructions;
  String image;

  String ingredients1;
  String ingredients2;
  String ingredients3;
  String ingredients4;
  String ingredients5;
  String ingredients6;
  String ingredients7;
  String ingredients8;
  String ingredients9;
  String ingredients10;
  String ingredients11;
  String ingredients12;
  String ingredients13;
  String ingredients14;
  String ingredients15;
  String ingredients16;
  String ingredients17;
  String ingredients18;
  String ingredients19;
  String ingredients20;

  MealItem({ this.id, this.name, this.category, this.area, this.instructions, this.image});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': name,
      'category': category,
      'area': area, 
      'instructions': instructions,
      'image': image
    };

    if (id != null) {
      map['id'] = id;}
    return map;
  }

  factory MealItem.fromJson(Map<String, dynamic> json){
    return MealItem(
      id: int.parse(json['idMeal']),
      name: json['strMeal'],
      category: json['strCategory'],
      area: json['strArea'],
      instructions: json['strInstructions'],
      image: json['strMealThumb']
    );
  }

}