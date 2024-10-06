import 'package:flutter/material.dart';

class Spider extends StatefulWidget {
  @override
  SpiderState createState() => SpiderState();
}

class SpiderState extends State<Spider>{
  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(

        child: Column(

          children:<Widget> [

            Padding(
              padding:EdgeInsets.only(top:60.0),
              child: Text('Spider mites, specifically the two-spotted spider mite,'
                  ' are tiny arachnids that infest tomato plants, causing damage by feeding on plant cells.'
                  ' They leave behind characteristic stippling on leaves,'
                  ' reducing the plants ability to photosynthesize and ultimately affecting tomato yield. '
                  'To prevent two-spotted spider mite infestations, employ practices such as regular monitoring,'
                  ' maintaining proper humidity levels, using predatory mites,'
                  ' and applying neem oil or insecticidal soap as organic control measures.'
                  ' Additionally, practicing good garden hygiene and avoiding excessive nitrogen '
                  'fertilization can help deter these pests.'
                  ' Early detection and prompt action are crucial at effective prevention.',
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
