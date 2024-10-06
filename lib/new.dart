import 'package:flutter/material.dart';

class LookCheck extends StatefulWidget {
  @override
  InsightsStateState createState() => InsightsStateState();
}

class Disease {
  final String name;
  final String details;
  Disease({required this.name, required this.details});
}

class InsightsStateState extends State<LookCheck> {
  late List<Disease> diseases;

  @override
  void initState() {
    super.initState();
    diseases = [
      Disease(name:'Bacterial Spot',details:'Bacterial spot disease in tomatoes causes dark lesions on leaves, stems, and fruit. Prevent it by using disease-resistant varieties, practicing crop rotation, maintaining garden hygiene, avoiding overhead watering, and applying copper-based sprays or bactericides if needed.'),
      Disease(name:'Early Blight',details:'Early blight is a fungal disease affecting tomato plants, characterized by dark spots on leaves that can lead to yellowing and plant decline. To prevent its occurrence, it is crucial to practice crop rotation with non-solanaceous plants, maintain cleanliness by removing infected debris, ensure proper spacing for optimal air circulation, use mulch to prevent soil splashing onto leaves, adopt soil-directed watering methods to avoid foliage moisture, apply fungicides early or preventively as recommended, and consider choosing tomato varieties resistant to early blight. These measures collectively contribute to mitigating the risk and impact of early blight on tomato crops.'),
      Disease(name: 'Late Blight', details: 'Late blight is a destructive disease in tomatoes caused by Phytophthora infestans. Symptoms include water-soaked lesions on leaves and rapid spread in cool, humid conditions. To prevent it, choose resistant varieties, practice crop rotation, maintain proper spacing, use mulch, apply fungicides as needed, water at the base in the morning, monitor for early signs, and promptly remove and destroy infected plant parts. Integrated pest management is crucial for effective prevention and management.'),
      Disease(name:'Leaf Mold',details:'Leaf mold disease in tomatoes, caused by the fungus *Fulvia fulva*, leads to yellowing and distinctive patches on leaves. Prevent it by ensuring air circulation, watering at the base, using mulch, pruning, selecting resistant varieties, and applying fungicides as needed.' ),
      Disease(name:'Septoria Leaf Spot',details: ' Septoria leaf spot is a common fungal disease affecting tomato plants. It presents as small dark spots with a lighter center on the leaves, eventually leading to leaf yellowing and defoliation. To prevent it, employ good gardening practices such as crop rotation, proper spacing, and consistent pruning to enhance air circulation. Applying fungicides early in the season can also help manage Septoria leaf spot.'),
      Disease(name:'Spider Mites Two Spotted',details:'Spider mites, specifically the two-spotted spider mite, are tiny arachnids that infest tomato plants, causing damage by feeding on plant cells. They leave behind characteristic stippling on leaves, reducing the plants ability to photosynthesize and ultimately affecting tomato yield. To prevent two-spotted spider mite infestations, employ practices such as regular monitoring, maintaining proper humidity levels, using predatory mites, and applying neem oil or insecticidal soap as organic control measures. Additionally, practicing good garden hygiene and avoiding excessive nitrogen fertilization can help deter these pests. Early detection and prompt action are crucial at effective prevention.'),
      Disease(name:'Target Spot',details:'Target spot disease in tomatoes is a fungal infection caused by the pathogen Corynespora cassiicola. It manifests as dark, concentric circles on leaves, affecting the plants health and reducing fruit yield. To prevent target spot, implement good sanitation practices, ensure proper air circulation, and apply fungicides as a preventive measure. Pruning infected leaves and avoiding overhead watering can also help manage the disease.'),
      Disease(name:'Mosaic Virus',details:'My king, Tomato Mosaic Virus (ToMV) is a plant disease affecting tomatoes, characterized by mosaic-like patterns on leaves, stunted growth, and reduced fruit quality. It is primarily spread through infected seeds, plant debris, or contaminated tools. To prevent ToMV, practice strict hygiene, use certified disease-free seeds, avoid smoking near plants (as tobacco can harbor the virus), and control insect vectors. Additionally, crop rotation and resistant tomato varieties can contribute to effective prevention strategies.'),
      Disease(name:'Yellow Leaf Curl Virus',details: 'Yellow Leaf Curl Virus (TYLCV) in tomatoes causes leaf curling, yellowing, and reduced yield. Prevent it by planting resistant varieties, controlling whiteflies, practicing crop rotation, removing infected plants promptly, using protective barriers, monitoring for early detection, and maintaining good garden hygiene.')
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disease Insights in Tomato Plants'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: diseases.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  title: Text(diseases[index].name),
                  children: [
                    ListTile(
                      title: Text(diseases[index].details),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
