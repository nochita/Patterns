import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:patterns/configurations.dart';
import 'package:patterns/imagesHelper.dart';

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
  Configurations configurations = Configurations();
  ImagesHelper imagesHelper = ImagesHelper();

  @override
  void initState() {
    super.initState();
    configurations.regenerate();
  }

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
                child: Text('AGAIN'),
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
      configurations.regenerate();
    });
  }

  List<Widget> _getImages() => imagesHelper.getImages(configurations);
}
