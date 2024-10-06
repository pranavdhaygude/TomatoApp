import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tflite/flutter_tflite.dart';

class ImagePickerScreen extends StatefulWidget {
  @override
  ImagePickerScreenState createState() => ImagePickerScreenState();
}

class ImagePickerScreenState extends State<ImagePickerScreen> {
  File? _image;
  String? _inferenceResults;

  @override
  void initState() {
    super.initState();
    _loadModel();
  }

  void _loadModel() async {
    try {
      await Tflite.loadModel(
        model: 'assets/plant_disease_model.tflite',
        labels: 'assets/plant_labels.txt', // Optional: Include if you have labels
      );
    } catch (e) {
      print('Error loading model: $e');
    }
  }

  Future<void> _performInference(File imageFile) async {
    try {
      var recognitions = await Tflite.runModelOnImage(
        path: imageFile.path,
        numResults: 1,
        threshold: 0.1,
        imageMean: 127.5,
        imageStd: 127.5,
      );

      // Handle the inference results as needed
      print("Inference Results: $recognitions");

      // Update the UI with the inference results
      setState(() {
        _inferenceResults = 'Inference Results: $recognitions';
      });
    } catch (e) {
      // Handle inference errors
      print('Error during inference: $e');
      setState(() {
        _inferenceResults = 'Error during inference: $e';
      });
    }
  }
  @override

  void dispose() {
    Tflite.close();
    super.dispose();
  }

  Future<void> _getImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: source);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
        _performInference(_image!);
      } else {
        print("No image selected or captured.");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _image == null
              ? Text("No Image selected ")
              : Image.file(
            _image!,
            height: 250,
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => _getImage(ImageSource.camera),
                child: Text('Capture Image'),
              ),
              ElevatedButton(
                onPressed: () => _getImage(ImageSource.gallery),
                child: Text('Select from Gallery'),
              ),
            ],
          ),
          SizedBox(height: 20),
          // Display the inference results
          if (_inferenceResults != null)
            Text(
              _inferenceResults!,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
        ],
      ),
    );
  }
}
