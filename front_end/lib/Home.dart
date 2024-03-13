import 'package:flutter/material.dart';
import 'package:life_redemption/Intresting_Stories.dart';
import 'package:life_redemption/chat.dart';
import 'package:life_redemption/main.dart';
import 'package:life_redemption/recover.dart';
import 'package:life_redemption/Doctor.dart';

class userdata {
  String name = "";
  String email = "";
  int phonenumber = 0;
  userdata({
    required this.name,
    required this.email,
    required this.phonenumber,
  });
}

class home extends StatefulWidget {
  userdata data;
  home({required this.data});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    Color oxfordBlue = Color.fromRGBO(0, 33, 71, 1.0);
    Color violetColor = Color.fromRGBO(148, 0, 211, 1.0);
    Color lightpurple = Color(0xFF592693);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
            icon: Icon(
              Icons.keyboard_backspace,
              size: 30.0,
              color: Colors.blue[800],
            ),
          ),
          backgroundColor: oxfordBlue,
          title: Center(
            child: Row(
              children: [
                SizedBox(width: 0.0),
                Text(
                  "LIFE",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.blue[700],
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(width: 6.0),
                Text(
                  "RED",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.lightBlue[900],
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  "EMPTION",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.blueGrey[700],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      endDrawer: Drawer(
        backgroundColor: oxfordBlue,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: oxfordBlue,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: lightpurple,
                child: Text(
                  widget.data.name[0],
                  style: TextStyle(fontSize: 35.0, color: Colors.white),
                ),
              ),
              accountName: Container(
                child: Center(child: Text(widget.data.name)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[800],
                ),
                height: 25.0,
                width: 100.0,
              ),
              accountEmail: Container(
                child: Text("  " + widget.data.email),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[800],
                ),
                height: 25.0,
                width: 185.0,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text(
                      "Interesting Stories",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    //leading: Icon(Icons.article),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => stories(data: widget.data)),
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Scientific Methods",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //leading: Icon(Icons.science),
                    onTap: () {
                      print("going to chat page");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatbotApp()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Notable Recoveries",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //leading: Icon(Icons.monitor_heart_sharp),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => recovery(data: widget.data)),
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Best Councellers",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //leading: Icon(Icons.account_circle_rounded),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => doctor(data: widget.data)),
                      );
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              title: Container(
                child: Text(
                  "  Logout",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[800],
                ),
                height: 25.0,
                width: 50.0,
              ),
              //leading: Icon(Icons.account_circle_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(" "),
            Text(" "),
            Text(
                "Welcome to Life Redemption - Real Stories, Expert Insights, Scientific Understanding "),
            Text(" "),
            Text(" Why Life Redemption?"),
            Text(" "),
            Text(''''📖 Real-Time Stories:
              Experience the power of real stories from individuals who have faced the challenges of drug abuse, conquered their struggles, and emerged stronger. These narratives provide a firsthand look at the impact of drug misuse on lives and inspire hope for recovery. '''),
            Text(""),
            Text('''👩‍⚕️ Expert Insights:
Connect with a network of reputable doctors and healthcare professionals specializing in addiction and recovery. Access credible information, expert opinions, and guidance to better understand the medical aspects of drug abuse and its treatment.'''),
            Text(" "),
            Text('''🔬 Scientific Methods:
Dive into the world of science-backed information on drug addiction. Explore the latest research, treatment methods, and breakthroughs in the field. Our commitment to scientific accuracy ensures that you have access to the most reliable and up-to-date information.'''),
          ],
        ),
      ),
    );
  }
}
