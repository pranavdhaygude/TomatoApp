import 'package:flutter/material.dart';
import 'package:pant_health/bacterial.dart';
import 'package:pant_health/early.dart';
import 'package:pant_health/late.dart';
import 'package:pant_health/leaf.dart';
import 'package:pant_health/septoria.dart';
import 'package:pant_health/spider.dart';
import 'package:pant_health/target.dart';
import 'package:pant_health/mosaic.dart';
import 'package:pant_health/yellow.dart';

class Insights extends StatefulWidget {
  @override
  InsightsState createState() => InsightsState();
}

class InsightsState extends State<Insights> {
  @override
  Widget build(BuildContext context){
    return Column(
      children:<Widget> [
        Padding(
          padding: EdgeInsets.only(left: 65,top: 10), // Add padding of 8.0 to all sides
          child: Text(
            'Diseases in Tomato Plants',
            style: TextStyle(
              fontSize: 20.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(top:10.0,left: 50),
        child:ElevatedButton(
          onPressed: () {

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BacterialSpot()), // Use BacterialSpot widget, not BacterialSpotState
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.white, // Set the background color of the button
            // You can also customize other properties such as padding, shape, etc.
          ),
          child: Text('Bacterial Spot',
          style: TextStyle(
            color: Colors.black,
          ),),
        )
        ),
        Padding(padding: EdgeInsets.only(top:15.0,left:50),
            child:ElevatedButton(
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EarlyBlight()), // Use BacterialSpot widget, not BacterialSpotState
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Set the background color of the button
                // You can also customize other properties such as padding, shape, etc.
              ),
              child: Text('Early Blight',
              style: TextStyle(
                color: Colors.black,
              ),),
            )
        ),
        Padding(padding: EdgeInsets.only(top:15.0,left:50),
            child:ElevatedButton(
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LateBlight()), // Use BacterialSpot widget, not BacterialSpotState
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Set the background color of the button
                // You can also customize other properties such as padding, shape, etc.
              ),
              child: Text('Late Blight',
              style:TextStyle(
                color: Colors.black,
              )),
            )
        ),
        Padding(padding: EdgeInsets.only(top:15.0,left:50),
            child:ElevatedButton(
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LeafMold()), // Use BacterialSpot widget, not BacterialSpotState
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Set the background color of the button
                // You can also customize other properties such as padding, shape, etc.
              ),
              child: Text('Leaf Mold',
              style:TextStyle(
                color: Colors.black,
              )),
            )
        ),
        Padding(padding: EdgeInsets.only(top:15.0,left:50),
            child:ElevatedButton(
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Septoria()), // Use BacterialSpot widget, not BacterialSpotState
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Set the background color of the button
                // You can also customize other properties such as padding, shape, etc.
              ),
              child: Text('Septoria Leaf Spot'
              ,style:TextStyle(
                    color: Colors.black,
                  )),

            )
        ),
        Padding(padding: EdgeInsets.only(top:15.0,left:50),
            child:ElevatedButton(
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Spider()), // Use BacterialSpot widget, not BacterialSpotState
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Set the background color of the button
                // You can also customize other properties such as padding, shape, etc.
              ),
              child: Text('Spider Mites Two Spotted',
              style:TextStyle(
                color:Colors.black,
              )),
            )
        ),
        Padding(padding: EdgeInsets.only(top:15.0,left:50),
            child:ElevatedButton(
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Target()), // Use BacterialSpot widget, not BacterialSpotState
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Set the background color of the button
                // You can also customize other properties such as padding, shape, etc.
              ),
              child: Text('Target Spot',
              style:TextStyle(
                color:Colors.black,
              )),
            )
        ),
        Padding(padding: EdgeInsets.only(top:15.0,left:50),
            child:ElevatedButton(
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Mosaic()), // Use BacterialSpot widget, not BacterialSpotState
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Set the background color of the button
                // You can also customize other properties such as padding, shape, etc.
              ),
              child: Text('Mosaic Virus',
              style:TextStyle(
                color:Colors.black,
              )),
            )
        ),
        Padding(padding: EdgeInsets.only(top:15.0,left:50),
            child:ElevatedButton(
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Yellow()), // Use BacterialSpot widget, not BacterialSpotState
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white, // Set the background color of the button
                // You can also customize other properties such as padding, shape, etc.
              ),
              child: Text('Yellow Leaf Curl Virus',
              style: TextStyle(
                color: Colors.black,
              ),),
            )
        ),

      ],
    );
  }
}