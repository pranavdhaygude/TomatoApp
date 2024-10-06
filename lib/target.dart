import 'package:flutter/material.dart';

class Target extends StatefulWidget {
  @override
  TargetState createState() => TargetState();
}

class TargetState extends State<Target>{
  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(

        child: Column(

          children:<Widget> [

            Padding(
              padding:EdgeInsets.only(top:60.0),
              child: Text('Target spot disease in tomatoes is a fungal infection caused by the pathogen Corynespora cassiicola.'
                  ' It manifests as dark, concentric circles on leaves,'
                  ' affecting the plants health and reducing fruit yield.'
                  ' To prevent target spot, implement good sanitation practices, ensure proper air circulation,'
                  ' and apply fungicides as a preventive measure. Pruning infected leaves and'
                  ' avoiding overhead watering can also help manage the disease.',
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
