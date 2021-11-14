import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text('Medical Chronics'),
          centerTitle: true,
          backgroundColor: Colors.teal[300],
          foregroundColor: Colors.white,
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              Text(
                'Main Screen',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/list');
                  },
                  child: Text('Navigate next'))
            ],
          ),
        ));
  }
}
