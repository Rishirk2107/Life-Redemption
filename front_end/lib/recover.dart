import 'package:flutter/material.dart';
import 'package:life_redemption/Home.dart';
import 'dart:math';

int getRandomIndex(List<dynamic> array) {
  if (array.isEmpty) {
    throw ArgumentError("The array must not be empty.");
  }

  Random random = Random();

  int randomIndex = random.nextInt(array.length);

  return randomIndex;
}

class recovery extends StatefulWidget {
  final userdata data;
  recovery({required this.data});

  @override
  State<recovery> createState() => _recoveryState();
}

class _recoveryState extends State<recovery> {
  String title = "";
  String content = "";
  var names = [
    '''
Dr. Sarah's journey from the depths of addiction to becoming a successful physician is a testament to the transformative power of recovery and resilience. Her story serves as an inspiration for many others facing similar struggles.

Sarah's turning point came when she realized the destructive path her life was on and decided to seek help. With the unwavering support of a rehabilitation program and her family, she embraced the challenging but rewarding journey of recovery. During this process, Sarah not only conquered her addiction but also discovered a newfound passion for helping others.

Motivated by her own experiences, Sarah decided to pursue a career in medicine. Despite the challenges and skepticism she faced, she worked tirelessly to excel in her studies. Her determination and commitment to her newfound goal became a driving force that propelled her forward.

Against all odds, Sarah's hard work paid off, and she achieved the remarkable feat of gaining admission to medical school. Her journey through medical education was not without its trials, but Sarah's resilience and the lessons she learned during her recovery propelled her forward.

Today, Dr. Sarah stands as a beacon of hope and inspiration. She not only practices medicine but also serves as a living example of how individuals can overcome the darkest moments in their lives and emerge stronger on the other side. Dr. Sarah's story resonates with those on the path to recovery, showing them that transformation is possible and that they, too, can achieve their dreams with determination, support, and a commitment to their own well-being.''',
    '''Mike's story is a powerful narrative of redemption and positive transformation that unfolded against the backdrop of incarceration. His journey began with a descent into the depths of addiction, which eventually led to a destructive path resulting in imprisonment. However, within the confines of prison, Mike found the determination and strength to turn his life around.

While serving his time, Mike recognized the need for change and decided to use his incarceration as an opportunity for self-improvement. He dedicated himself to education, earning his GED and even enrolling in college courses. This commitment to learning not only expanded his knowledge but also became a driving force for personal growth and development.

Upon his release, Mike faced the crucial choice of either returning to his old habits or forging a new path. He chose the latter, committing himself to staying clean and contributing positively to society. Mike's personal transformation didn't end with his own recovery; it became the foundation for a broader mission.

Motivated by his experiences, Mike founded a non-profit organization with a focus on supporting rehabilitation programs for inmates. Recognizing the challenges individuals face upon release, he also established mentorship programs to guide and assist them in their reintegration into society. By doing so, Mike aimed to break the cycle of addiction and incarceration, providing others with the tools and support needed for a fresh start.

Mike's story serves as a powerful reminder that it is never too late for redemption and positive change. His journey from the depths of addiction to incarceration and, ultimately, to creating a non-profit organization reflects the resilience of the human spirit. Mike not only rebuilt his own life but also dedicated himself to improving the lives of others, embodying the transformative impact of second chances and the potential for positive change, even in the face of significant challenges.''',
  ];
  var titles = [
    '''Sarah's Triumph: From Darkness to Medical School''',
    '''Mike's Miracle: From Prison to Philanthropy'''
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => home(data: widget.data)),
                );
              },
              icon: Icon(Icons.keyboard_backspace),
            ),
            backgroundColor: Colors.deepPurple,
            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.local_hospital, color: Colors.white),
                  SizedBox(width: 8.0),
                  Text(
                    "NOTABLE RECOVERIES",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      title = "";
                      content = "";
                      int ind = getRandomIndex(names);
                      title += titles[ind];
                      content += names[ind];
                    });
                  },
                  child: Text(
                    "GET STORY",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),
                  )),
              Text(title,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  )),
              Text(content,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ))
            ],
          ),
        ));
  }
}
