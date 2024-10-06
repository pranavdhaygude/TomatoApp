import 'package:flutter/material.dart';

class BacterialSpot extends StatefulWidget {
  @override
  BacterialSpotState createState() => BacterialSpotState();
}

class BacterialSpotState extends State<BacterialSpot>{
  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(

      child: Column(

      children:<Widget> [

        Padding(
            padding:EdgeInsets.only(top:60.0),
            child: Text('Bacterial spot disease in tomatoes causes dark lesions on leaves'
                ', stems, and fruit. Prevent it by using disease-resistant varieties, '
                'practicing crop rotation, maintaining garden hygiene,'
                ' avoiding overhead watering,'
                ' and applying copper-based sprays or bactericides if needed.',
              style: TextStyle(
                fontSize: 20.0,
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
