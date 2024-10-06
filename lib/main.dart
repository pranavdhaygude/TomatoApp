import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pant_health/image.dart';
import 'package:pant_health/insights.dart';
import 'package:pant_health/new.dart';
import 'package:plant_icons/plant_icons_data.dart';
import 'package:pant_health/homie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyYourState createState() => MyYourState();
}

class MyYourState extends State<MyApp> {

  bool showList = false;
  int _currentIndex = 0; // Variable to track the selected item

  // Define a list of screens or content for each bottom navigation item
  final List<Widget> _screens = [
    // Define your screens here
    HomeScreen(),
    Scan(),
    PlantsState(),
  ];

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title : const Text("Tomato Plant Health",
            style:TextStyle(
              fontSize: 20.0,
              fontStyle: FontStyle.normal,
              color: Colors.black,
            ),
          ),


        ),
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            fixedColor: Colors.greenAccent,
            items: const [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: "Scan",
                icon: Icon(Icons.add_a_photo_sharp),
              ),
              BottomNavigationBarItem(
                label: "Insight",
                icon: Icon(PlantIcons.plant),
              ),

            ],
            onTap: (int indexOfItem) {
                  setState(() {

                        _currentIndex = indexOfItem;
                       });
                  },


  )
      ),
      debugShowCheckedModeBanner: false,

    );


  }
}


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BroScreen();
  }
}

class Scan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ImagePickerScreen();
  }
}

class PlantsState extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Insights();
  }
}

