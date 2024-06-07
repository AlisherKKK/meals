import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foods/data/const_data.dart';

final mealsProvider = Provider(
  (ref) {
    return dummyMeals;
  },
);
