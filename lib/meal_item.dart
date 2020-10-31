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

  MealItem({ 
    this.id, 
    this.name, 
    this.category, 
    this.area, 
    this.instructions, 
    this.image,
    this.ingredients1,
    this.ingredients2,
    this.ingredients3,
    this.ingredients4,
    this.ingredients5,
    this.ingredients6,
    this.ingredients7,
    this.ingredients8,
    this.ingredients9,
    this.ingredients10,
    this.ingredients11,
    this.ingredients12,
    this.ingredients13,
    this.ingredients14,
    this.ingredients15,
    this.ingredients16,
    this.ingredients17,
    this.ingredients18,
    this.ingredients19, 
    this.ingredients20
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': name,
      'category': category,
      'area': area, 
      'instructions': instructions,
      'image': image,
      'ingredients1': ingredients1,
      'ingredients2': ingredients2,
      'ingredients3': ingredients3,
      'ingredients4': ingredients4,
      'ingredients5': ingredients5,
      'ingredients6': ingredients6,
      'ingredients7': ingredients7,
      'ingredients8': ingredients8,
      'ingredients9': ingredients9,
      'ingredients10': ingredients10,
      'ingredients11': ingredients11,
      'ingredients12': ingredients12,
      'ingredients13': ingredients13,
      'ingredients14': ingredients14,
      'ingredients15': ingredients15,
      'ingredients16': ingredients16,
      'ingredients17': ingredients17,
      'ingredients18': ingredients18,
      'ingredients19': ingredients19,
      'ingredients20': ingredients20,


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