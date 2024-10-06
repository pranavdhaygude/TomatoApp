import 'package:flutter/material.dart';

class LeafMold extends StatefulWidget {
  @override
  LeafMoldState createState() => LeafMoldState();
}

class LeafMoldState extends State<LeafMold>{
  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(

        child: Column(

          children:<Widget> [

            Padding(
              padding:EdgeInsets.only(top:60.0),
              child: Text('Leaf mold disease in tomatoes, caused by the fungus *Fulvia fulva*,'
                  ' leads to yellowing and distinctive patches on leaves. '
                  'Prevent it by ensuring air circulation, watering at the base, using mulch,'
                  ' pruning, selecting resistant varieties, and applying fungicides as needed.',
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
