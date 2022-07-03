class ModelMeal {
  late String id;
  late List<String> categories;
  late String title;
  late int affordability;
  late int complexity;
  late String complexityName;
  late String imageUrl;
  late int duration;
  late List<String> ingredients;
  late List<String> steps;
  late bool isGlutenFree;
  late bool isVegan;
  late bool isVegetarian;
  late bool isLactoseFree;

  ModelMeal(
      {this.id = "",
      this.categories = const [],
      this.title = "",
      this.affordability = -1,
      this.complexity = -1,
      this.imageUrl = "",
      this.duration = -1,
      this.ingredients = const [],
      this.steps = const [],
      this.isGlutenFree = false,
      this.isVegan = false,
      this.isVegetarian = false,
      this.isLactoseFree = false});

  ModelMeal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categories = json['categories'].cast<String>();
    title = json['title'];
    affordability = json['affordability'];
    complexity = json['complexity'];
    switch(complexity) {
      case 0:
        complexityName = "简单";
        break;
      case 1:
        complexityName = "中等";
        break;
      case 2:
        complexityName = "困难";
        break;
    }
    imageUrl = json['imageUrl'];
    duration = json['duration'];
    ingredients = json['ingredients'].cast<String>();
    steps = json['steps'].cast<String>();
    isGlutenFree = json['isGlutenFree'];
    isVegan = json['isVegan'];
    isVegetarian = json['isVegetarian'];
    isLactoseFree = json['isLactoseFree'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['categories'] = categories;
    data['title'] = title;
    data['affordability'] = affordability;
    data['complexity'] = complexity;
    data['imageUrl'] = imageUrl;
    data['duration'] = duration;
    data['ingredients'] = ingredients;
    data['steps'] = steps;
    data['isGlutenFree'] = isGlutenFree;
    data['isVegan'] = isVegan;
    data['isVegetarian'] = isVegetarian;
    data['isLactoseFree'] = isLactoseFree;
    return data;
  }
}
