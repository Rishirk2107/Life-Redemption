import 'package:flutter/material.dart';
import 'package:life_redemption/Home.dart';
import 'package:supabase/supabase.dart';
import 'package:life_redemption/signup.dart';
import 'package:life_redemption/initial.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void _navigateToHome(BuildContext context, userdata data) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => home(data: data),
    ),
  );
}

void main() => runApp(MaterialApp(home: ini()));

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> sendDataToFlask(String data, String email) async {
    final String url =
        'http://127.0.0.1:5000/getuser'; // Update with your Flask server URL

    Map<String, dynamic> dataToSend = {
      "name": data,
      "email": email,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(dataToSend),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        String responseMessage = responseData["message"];
        print("Response from Flask: ${jsonDecode(response.body)}");
      } else {
        print("Error: ${response.reasonPhrase}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  final supabase = SupabaseClient(
    'https://fsuxuzmkthrdswsoojvy.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZzdXh1em1rdGhyZHN3c29vanZ5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDE3OTc0NzAsImV4cCI6MjAxNzM3MzQ3MH0.K4ZLrLQhDIkGgaZcb-USG1xbIFEr4eE3iL4tiXu_3O8',
  );

  TextEditingController _decimalController1 = TextEditingController();
  TextEditingController _decimalController2 = TextEditingController();
  String email = "";
  String password = "";
  String invalid = "";
  Future<void> fetchData(String email, String password) async {
    try {
      final response = await supabase
          .from('registration')
          .select()
          .eq('email', email)
          .eq('password', password)
          .execute();
      if (!response.data.isEmpty) {
        setState(() {
          invalid = "";
        });
        userdata data = userdata(
          name: response.data[0]["name"],
          email: response.data[0]["email"],
          phonenumber: response.data[0]["mobile_number"],
        );
        sendDataToFlask(response.data[0]["name"], response.data[0]["email"]);
        _navigateToHome(context, data);
        print('Data fetched: ${response.data}');
      } else {
        setState(() {
          invalid = "INVALID CREDENTIALS";
        });
        print("INVALID CREDENTIALS");
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/login.png'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 35, top: 80),
                  child: Text(
                    'WELCOME\nBACK',
                    style: TextStyle(color: Colors.white, fontSize: 33),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.5,
                        right: 35,
                        left: 35),
                    child: Column(children: [
                      TextField(
                        controller: _decimalController1,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: _decimalController2,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sign In',
                            style: TextStyle(
                              color: Color(0xff4c505b),
                              fontSize: 27,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Color(0xff4c505b),
                            child: IconButton(
                              onPressed: () async {
                                String input1 = _decimalController1.text;
                                String input2 = _decimalController2.text;
                                await fetchData(input1, input2);
                              },
                              icon: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => signup()),
                          );
                        },
                        child: Text('SIGN UP',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 18,
                                color: Color(0xff4c505b))),
                      ),
                    ])),
                Container(
                  padding: EdgeInsets.only(left: 120, top: 575),
                  child: Text(
                    invalid,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
