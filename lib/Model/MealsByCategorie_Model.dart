class MealsByCategorie {
  String? strMeal;
  String? strMealThumb;
  String? idMeal;

  MealsByCategorie({this.strMeal, this.strMealThumb, this.idMeal});

  MealsByCategorie.fromJson(Map<String, dynamic> json) {
    strMeal = json['strMeal'];
    strMealThumb = json['strMealThumb'];
    idMeal = json['idMeal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strMeal'] = this.strMeal;
    data['strMealThumb'] = this.strMealThumb;
    data['idMeal'] = this.idMeal;
    return data;
  }
}
