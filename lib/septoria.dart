import 'package:flutter/material.dart';

class Septoria extends StatefulWidget {
  @override
  SeptoriaState createState() => SeptoriaState();
}

class SeptoriaState extends State<Septoria>{
  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(

        child: Column(

          children:<Widget> [

            Padding(
              padding:EdgeInsets.only(top:60.0),
              child: Text(' Septoria leaf spot is a common fungal disease affecting tomato plants.'
                  ' It presents as small dark spots with a lighter center on the leaves,'
                  ' eventually leading to leaf yellowing and defoliation.'
                  ' To prevent it, employ good gardening practices such as crop rotation,'
                  ' proper spacing, and consistent pruning to enhance air circulation.'
                  ' Applying fungicides early in the season can also help manage Septoria leaf spot.',
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
