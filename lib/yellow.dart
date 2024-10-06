import 'package:flutter/material.dart';

class Yellow extends StatefulWidget {
  @override
  YellowState createState() => YellowState();
}

class YellowState extends State<Yellow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color here
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: Text(
                'Yellow Leaf Curl Virus (TYLCV) in tomatoes causes leaf curling,'
                    ' yellowing, and reduced yield. Prevent it by planting resistant varieties, '
                    'controlling whiteflies, practicing crop rotation, removing infected plants promptly,'
                    ' using protective barriers, monitoring for early detection, and maintaining good garden hygiene.',
                style: TextStyle(
                  fontSize: 15.0,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Return to Insights Page'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
