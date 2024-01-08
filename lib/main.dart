// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'UI/home_screen.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomeScreen(),
//     );
//   }
// }
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> numbers = List.generate(80, (index) => index + 1);
  int currentIndex = 0;
  int displayCount = 4;

  List<int> getDisplayedNumbers() {
    int start = currentIndex;
    int end = start + displayCount;
    return numbers.sublist(start, end);
  }

  void showPrevious() {
    if (currentIndex - displayCount >= 0) {
      setState(() {
        currentIndex -= displayCount;
      });
    }
  }

  void showNext() {
    if (currentIndex + displayCount < numbers.length) {
      setState(() {
        currentIndex += displayCount;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<int> displayedNumbers = getDisplayedNumbers();

    return Scaffold(
      appBar: AppBar(
        title: Text("Number Display Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Displayed Numbers:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              displayedNumbers.join(", "),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: showPrevious,
                  child: Text('Previous'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: showNext,
                  child: Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
