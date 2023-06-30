import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:patterns/random_patterns.dart';

const int IMAGES_QUANTITY = 6;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late int randomImageA;
  late int randomImageB;
  late int randomQuantityPatternA;
  late int randomQuantityPatternB;
  late int randomPatternType;

  RandomHelper randomHelper = RandomHelper();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patrones con Vehiculos',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _getImages(),
            )),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: ElevatedButton(
                onPressed: () => _generateRandomNumbers(),
                child: Text('OTRA VEZ'),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 50)),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _generateRandomNumbers() {
    setState(() {
      randomImageA = randomHelper.getRandomQuantity(IMAGES_QUANTITY);
      randomImageB =
          randomHelper.getRandomNumberExcept(randomImageA, IMAGES_QUANTITY);

      randomQuantityPatternA = randomHelper.getRandomPattern(); // 1, 2 or 3
      randomQuantityPatternB = randomHelper.getRandomPattern();

      randomPatternType = randomHelper.getRandomPatternType();
    });
  }

  List<Widget> _getImages() {
    _generateRandomNumbers();

    //print('$randomImageA $randomImageB $randomQuantityPatternA $randomQuantityPatternB $randomPatternType');
    // type 0: A B A B
    // type 1: A B A
    // type 2: A B A(1)
    // type 3: A B A B(1)

    List<Widget> imageList = [];

    // add A B
    imageList.addAll(_getSequenceImages(randomQuantityPatternA, randomImageA));
    imageList.addAll(_getSequenceImages(randomQuantityPatternB, randomImageB));

    if (randomPatternType == 0) {
      // A B A B
      imageList
          .addAll(_getSequenceImages(randomQuantityPatternA, randomImageA));
      imageList
          .addAll(_getSequenceImages(randomQuantityPatternB, randomImageB));
    } else if (randomPatternType == 1) {
      // A B A
      imageList
          .addAll(_getSequenceImages(randomQuantityPatternA, randomImageA));
    } else if (randomPatternType == 2) {
      // A B A(1)
      imageList.add(_getImageWidget(randomImageA));
    } else if (randomPatternType == 3) {
      // A B A B(1)
      imageList
          .addAll(_getSequenceImages(randomQuantityPatternA, randomImageA));
      imageList.add(_getImageWidget(randomImageB));
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
