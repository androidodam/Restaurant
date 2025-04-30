import 'package:flutter_restaurant_app/models/food_model.dart';

class CartModel {
  int count;
  FoodModel foodModel;

  CartModel(
    this.count,
    this.foodModel,
  );
}
