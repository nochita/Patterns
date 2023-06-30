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
        appBar: AppBar(
          title: Text('Patterns'),
          actions: [
            PopupMenuButton(
                // add icon, by default "3 dot" icon
                icon: Icon(Icons.settings),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem<int>(
                      value: 0,
                      child: Text("Vehicles"),
                    ),
                    PopupMenuItem<int>(
                      value: 1,
                      child: Text("Solar System"),
                    ),
                  ];
                },
                onSelected: (value) {
                    setState(() {
                      configurations.isVehicles = value == 0;
                    });
                }),
          ],
        ),
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
