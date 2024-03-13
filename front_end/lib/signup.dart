import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:life_redemption/Home.dart';
import 'package:life_redemption/main.dart';
import 'package:supabase/supabase.dart';

class signup extends StatefulWidget {
  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final supabase = SupabaseClient(
    'https://fsuxuzmkthrdswsoojvy.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZzdXh1em1rdGhyZHN3c29vanZ5Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTcwMTc5NzQ3MCwiZXhwIjoyMDE3MzczNDcwfQ.gpqfNNsMrujwXjLG0R-JpV7MzB9tNucL3fy8mN9tONc',
  );
  TextEditingController _decimalController1 = TextEditingController();
  TextEditingController _decimalController2 = TextEditingController();
  TextEditingController _decimalController3 = TextEditingController();
  TextEditingController _decimalController4 = TextEditingController();
  String success = "";

  Future<void> insertData(String num, String a, String b, String c) async {
    try {
      final response = await supabase
          .from('registration')
          .select()
          .eq('email', b)
          .eq('password', c)
          .execute();
      if (!response.data.isEmpty) {
        setState(() {
          success = "Already registered user please Login";
        });
      } else {
        setState(() {
          success = "Successfully Signed in now login";
        });
        final response2 = await supabase.from('registration').upsert([
          {
            'mobile_number': num,
            'name': a,
            'email': b,
            'password': c,
          },
        ]).execute();
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
        image: AssetImage('assets/images/register.png'),
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
                    'CREATE\nACCOUNT',
                    style: TextStyle(color: Colors.white, fontSize: 33),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 220, right: 35, left: 35),
                    child: Column(children: [
                      TextField(
                        controller: _decimalController1,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      Text(" "),
                      TextField(
                        controller: _decimalController2,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      Text(" "),
                      TextField(
                        controller: _decimalController3,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Mobile Number',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      Text(""),
                      TextField(
                        obscureText: true,
                        controller: _decimalController4,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
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
                                String input3 = _decimalController3.text;
                                String input4 = _decimalController4.text;
                                await insertData(
                                    input3, input2, input1, input4);
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
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
                        },
                        child: Text('LOGIN',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 18,
                                color: Colors.white)),
                      ),
                    ])),
                Container(
                  padding: EdgeInsets.only(left: 100, top: 620),
                  child: Text(
                    success,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          )

          /*SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              TextField(
                controller: _decimalController1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter your mobile number',
                  labelStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              TextField(
                controller: _decimalController2,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Enter your name',
                  labelStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              TextField(
                controller: _decimalController3,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Enter your email',
                  labelStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              TextField(
                controller: _decimalController4,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Enter your password',
                  labelStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  String input1 = _decimalController1.text;
                  String input2 = _decimalController2.text;
                  String input3 = _decimalController3.text;
                  String input4 = _decimalController4.text;
                  int num = int.parse(input1);
                  await insertData(num, input2, input3, input4);
                },
                child: Text(
                  "SUBMIT",
                  style: TextStyle(
                    backgroundColor: Colors.blue,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.blue),
              ),
              Text(success),
              GestureDetector(
                onTap: () {
                  // Navigate to another Dart page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.blue,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          )),
        ),*/
          ),
    );
  }
}
