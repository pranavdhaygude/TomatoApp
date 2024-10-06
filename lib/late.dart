import 'package:flutter/material.dart';

class LateBlight extends StatefulWidget {
  @override
  LateBlightState createState() => LateBlightState();
}

class LateBlightState extends State<LateBlight>{
  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(

        child: Column(

          children:<Widget> [

            Padding(
              padding:EdgeInsets.only(top:60.0),
              child: Text('Late blight is a destructive disease in tomatoes caused by Phytophthora infestans.'
                  ' Symptoms include water-soaked lesions on leaves and rapid spread in cool, humid conditions.'
                  ' To prevent it, choose resistant varieties, practice crop rotation, maintain proper spacing, '
                  'use mulch, apply fungicides as needed, water at the base in the morning,'
                  ' monitor for early signs, and promptly remove and destroy infected plant parts.'
                  ' Integrated pest management is crucial for effective prevention and management.',
                style: TextStyle(
                  fontSize: 15.0,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),),

            ),
            Padding(padding:EdgeInsets.only(top:60.0),

                child:ElevatedButton(
                    onPressed:(){
                      Navigator.pop(context);
                    },
                    child:Text('Return to Insights Page')))
          ],
        )
    );
  }
}
