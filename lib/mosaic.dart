import 'package:flutter/material.dart';

class Mosaic extends StatefulWidget {
  @override
  MosaicState createState() => MosaicState();
}

class MosaicState extends State<Mosaic>{
  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(

        child: Column(

          children:<Widget> [

            Padding(
              padding:EdgeInsets.only(top:60.0),
              child: Text('Tomato Mosaic Virus (ToMV) is a plant disease affecting tomatoes,'
                  ' characterized by mosaic-like patterns on leaves, stunted growth, and reduced fruit quality.'
                  ' It is primarily spread through infected seeds, plant debris, or contaminated tools.'
                  ' To prevent ToMV, practice strict hygiene, use certified disease-free seeds,'
                  ' avoid smoking near plants (as tobacco can harbor the virus), and control insect vectors.'
                  ' Additionally, crop rotation and resistant tomato varieties can contribute to effective prevention strategies.',
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