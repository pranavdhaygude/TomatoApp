import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class BroScreen extends StatefulWidget {
  @override
  BroScreenState createState() => BroScreenState();
}

class BroScreenState extends State<BroScreen> {
  TextEditingController _plantController = TextEditingController();
  int? daysOfPlants;
  String fertilizerMessage = 'Your fertilizer amount will appear here';
  late Timer _timer;
  late int _remainingTimeInSeconds;
  late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    _remainingTimeInSeconds = 2* 24 * 60 * 60; // 2 days in seconds
    _initNotifications();
    _startTimer();
  }

  void _initNotifications() {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);
    _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTimeInSeconds > 0) {
        setState(() {
          _remainingTimeInSeconds--;
        });
      } else {
        _timer.cancel();
        _showNotification();
      }
    });
  }

  void _resetTimer() {
    setState(() {
      _remainingTimeInSeconds = 2 * 24 * 60 * 60; // Reset to 2 days in seconds
    });
    _startTimer();
  }

  void _showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'your_channel_id', // You can replace this with your channel ID
      'your_channel_name', // You can replace this with your channel name
       // You can replace this with your channel description
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );

    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await _flutterLocalNotificationsPlugin.show(
      0,
      'Timer Expired!',
      'It\'s time to take care of your plants.',
      platformChannelSpecifics,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.greenAccent,
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fertilizer Calculator',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextField(
                  controller: _plantController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Age of your Plant in days(click)'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      daysOfPlants = int.tryParse(_plantController.text);
                      if (daysOfPlants != null) {
                        if (0 <= daysOfPlants! && daysOfPlants! < 14) {
                          fertilizerMessage = "N_total:80 & P2O5:80 & K2O: 80 in ppm";
                        } else if (14 < daysOfPlants! && daysOfPlants! < 24) {
                          fertilizerMessage = "N_total:100 & P2O5:100 & K2O: 100 in ppm";
                        } else if (24 < daysOfPlants! && daysOfPlants! < 34) {
                          fertilizerMessage = "N_total:120 & P2O5:100 & K2O: 216 in ppm";
                        } else if (34 < daysOfPlants! && daysOfPlants! < 44) {
                          fertilizerMessage = "N_total:150 & P2O5:96 & K2O: 240 in ppm";
                        } else if (44 < daysOfPlants! && daysOfPlants! < 94) {
                          fertilizerMessage = "N_total:150 & P2O5:96 & K2O: 240 in ppm";
                        } else if (94 < daysOfPlants! && daysOfPlants! < 144) {
                          fertilizerMessage = "N_total:150 & P2O5:96 & K2O: 240 in ppm";
                        } else {
                          fertilizerMessage = "Please enter appropriate age";
                        }
                      } else {
                        fertilizerMessage = "Please enter age in days";
                      }
                    });
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            color: Colors.greenAccent,
            padding: EdgeInsets.all(10.0),
            child: Text(
              fertilizerMessage,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 106.0),
          Container(
            color: Colors.cyan,
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Time remaining: ${_formatDuration(Duration(seconds: _remainingTimeInSeconds))}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _resetTimer,
                  child: Text('Reset Timer'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
