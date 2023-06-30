import 'package:flutter/material.dart';
import 'package:patterns/configurations.dart';

class ImagesHelper {
  List<Widget> getImages(Configurations configurations) {
    //print('$randomImageA $randomImageB $randomQuantityPatternA $randomQuantityPatternB $randomPatternType');
    // type 0: A B A B
    // type 1: A B A
    // type 2: A B A(1)
    // type 3: A B A B(1)

    List<Widget> imageList = [];

    // add A B
    imageList.addAll(_getSequenceImages(
        configurations.randomQuantityPatternA, configurations.randomImageA));
    imageList.addAll(_getSequenceImages(
        configurations.randomQuantityPatternB, configurations.randomImageB));

    if (configurations.randomPatternType == 0) {
      // A B A B
      imageList.addAll(_getSequenceImages(
          configurations.randomQuantityPatternA, configurations.randomImageA));
      imageList.addAll(_getSequenceImages(
          configurations.randomQuantityPatternB, configurations.randomImageB));
    } else if (configurations.randomPatternType == 1) {
      // A B A
      imageList.addAll(_getSequenceImages(
          configurations.randomQuantityPatternA, configurations.randomImageA));
    } else if (configurations.randomPatternType == 2) {
      // A B A(1)
      imageList.add(_getImageWidget(configurations.randomImageA));
    } else if (configurations.randomPatternType == 3) {
      // A B A B(1)
      imageList.addAll(_getSequenceImages(
          configurations.randomQuantityPatternA, configurations.randomImageA));
      imageList.add(_getImageWidget(configurations.randomImageB));
    }

    // add empty box
    imageList.add(Flexible(child: Image.asset('assets/images/square.png')));

    return imageList;
  }

  List<Widget> _getSequenceImages(int randomQuantityPattern, int randomImage) {
    List<Widget> randomImages = [];
    for (int i = 1; i <= randomQuantityPattern; i++) {
      randomImages.add(_getImageWidget(randomImage));
    }
    return randomImages;
  }

  Widget _getImageWidget(int randomImage) {
    return Flexible(child: _getAssetByNumber(randomImage));
  }

  Image _getAssetByNumber(int number) {
    String assetPath = 'assets/images/bulldozer.jpg';
    switch (number) {
      case 0:
        assetPath = 'assets/images/concrete-mixer.jpg';
        break;
      case 1:
        assetPath = 'assets/images/garbage-truck.jpg';
        break;
      case 2:
        assetPath = 'assets/images/red-car.png';
        break;
      case 3:
        assetPath = 'assets/images/bulldozer.jpg';
        break;
      case 4:
        assetPath = 'assets/images/container.jpg';
        break;
      case 5:
        assetPath = 'assets/images/mosquito.jpg';
        break;
    }
    return Image.asset(assetPath);
  }
}
