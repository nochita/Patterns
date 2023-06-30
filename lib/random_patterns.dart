import 'dart:math';

class RandomHelper {
  getRandomPattern() => Random().nextInt(3) + 1;

  getRandomQuantity(int quantity) => Random().nextInt(quantity);

  int getRandomNumberExcept(int randomNumberToExclude, int quantity) {
    int randomNumber = Random().nextInt(quantity);
    while (randomNumberToExclude == randomNumber) {
      randomNumber = Random().nextInt(quantity);
    }
    return randomNumber;
  }

  getRandomPatternType() => Random().nextInt(4);
}
