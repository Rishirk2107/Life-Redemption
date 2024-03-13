import 'package:flutter/material.dart';
import 'package:life_redemption/main.dart';
import 'package:life_redemption/signup.dart';

void main() {
  runApp(ini());
}

class ini extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Life Redemption',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Life Redemption',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(0, 33, 71, 1.0),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => signup()),
                ); // Navigate to User Signup Page
              },
              child: Text('User Signup'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
              child: Text('User Login'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Admin Login Page
              },
              child: Text('Admin Login'),
            ),
          ],
        ),
      ),
    );
  }
}
