import 'package:patterns/random_patterns.dart';

const int IMAGES_QUANTITY = 6;

class Configurations {
  late int randomImageA;
  late int randomImageB;
  late int randomQuantityPatternA;
  late int randomQuantityPatternB;
  late int randomPatternType;

  regenerate() {
    RandomHelper randomHelper = RandomHelper();

    randomImageA = randomHelper.getRandomQuantity(IMAGES_QUANTITY);
    randomImageB =
        randomHelper.getRandomNumberExcept(randomImageA, IMAGES_QUANTITY);

    randomQuantityPatternA = randomHelper.getRandomPattern(); // 1, 2 or 3
    randomQuantityPatternB = randomHelper.getRandomPattern();

    randomPatternType = randomHelper.getRandomPatternType();
  }
}
