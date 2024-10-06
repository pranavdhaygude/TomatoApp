import 'package:flutter/material.dart';

class EarlyBlight extends StatefulWidget {
  @override
  EarlyBlightState createState() => EarlyBlightState();
}

class EarlyBlightState extends State<EarlyBlight>{
  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(

        child: Column(

          children:<Widget> [

            Padding(
              padding:EdgeInsets.only(top:60.0),
              child: Text('Early blight is a fungal disease affecting tomato plants,'
                  ' characterized by dark spots on leaves that can lead to yellowing and plant decline. '
                  'To prevent its occurrence, it is crucial to practice crop rotation with non-solanaceous plants, '
                  'maintain cleanliness by removing infected debris, ensure proper spacing for optimal air circulation,'
                  ' use mulch to prevent soil splashing onto leaves,'
                  ' adopt soil-directed watering methods to avoid foliage moisture,'
                  ' apply fungicides early or preventively as recommended, '
                  'and consider choosing tomato varieties resistant to early blight.'
                  ' These measures collectively contribute to mitigating the risk and impact of early blight on tomato crops.',
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
