import 'package:flutter/material.dart';
import 'dart:math';
import 'package:life_redemption/Home.dart';

int getRandomIndex(List<dynamic> array) {
  if (array.isEmpty) {
    throw ArgumentError("The array must not be empty.");
  }

  Random random = Random();

  int randomIndex = random.nextInt(array.length);

  return randomIndex;
}

class stories extends StatefulWidget {
  final userdata data;
  stories({required this.data});
  @override
  State<stories> createState() => _storiesState();
}

class _storiesState extends State<stories> {
  String title = "";
  String content = "";
  @override
  var names = [
    '''

Michael, a devoted husband and father of two, falls into the clutches of addiction after a work-related injury. Initially prescribed pain medication, he soon turns to illicit substances for a stronger escape from physical and emotional pain. As his addiction escalates, his behavior becomes erratic, and he loses his job.

His wife, Sarah, discovers the truth but, desperate to salvage their family, tries to help him seek treatment. Despite several attempts at rehab, Michael relapses each time. The strain on their marriage becomes unbearable, leading to a bitter divorce. Sarah, left to raise their children alone, faces financial hardship and emotional turmoil.

The children, once close-knit, bear witness to their father's decline. The older one becomes withdrawn, struggling academically, while the younger child exhibits behavioral issues. Michael's absence during pivotal moments in their lives leaves a void that cannot be filled.

Over time, Michael's health deteriorates, and his relationship with his children becomes strained. They grow distant, unable to comprehend or forgive the pain he has inflicted on their family. Michael, now homeless, roams the streets in search of his next fix, a mere shell of the family man he once was.''',
    '''

Once a rising star in the corporate world, John Harper seemed to have it all – a thriving career, a loving family, and a lifestyle many envied. However, beneath the polished exterior lurked a man haunted by stress, anxiety, and the constant pressure to maintain his success.

One day, at a high-profile business event, John encountered a mysterious figure who introduced him to a designer drug known as the "Velvet Spiral." Promising an escape from the relentless demands of his professional life, the drug seemed like a temporary reprieve. Little did John know that this seemingly innocent indulgence would send him on a downward spiral, unraveling the fabric of his existence.

As John delved deeper into the Velvet Spiral's embrace, the drug's allure took hold, clouding his judgment and distorting his priorities. Financial ruin loomed as he spent exorbitant amounts on sustaining his addiction. The high-flying executive became a mere shadow of his former self, missing deadlines, neglecting projects, and eventually losing his job.

The impact of John's addiction rippled through his family life. His once-strong relationship with his wife, Sarah, shattered as trust eroded. Their home, once filled with laughter, became a battleground of arguments and disappointments. The strain on their marriage took a toll on their children, who witnessed their once-heroic father succumb to the throes of addiction.

Isolated and desperate, John's downward spiral reached its nadir. The Velvet Spiral, once a source of escape, had ensnared him in a web of dependency. Sarah, torn between love and self-preservation, made the difficult decision to separate, hoping it would serve as a wake-up call for John.''',
    '''

Sarah, a talented artist, was drawn into the enigmatic world of the drug "Crimson Haze," lured by promises of heightened creativity and altered perceptions. What began as a curious exploration soon escalated into a perilous journey, casting a shadow over her once-thriving art career.

As Sarah's addiction to Crimson Haze deepened, the vibrant colors and emotional depth that once defined her canvases began to crumble. The drug, initially perceived as a wellspring of inspiration, distorted her unique artistic style, alienating her from the art community that had once celebrated her work.

The social circles where Sarah once thrived became replaced by solitary encounters with the drug. Her family, friends, and the art community watched in dismay as the once-sociable artist withdrew into a self-imposed isolation. Crimson Haze became a silent wedge, driving a chasm between Sarah and those who desperately sought to help.

Attempts at intervention were met with resistance as the drug tightened its grip, rendering Sarah increasingly unreachable. The once-supportive network around her found itself helpless, unable to break through the influence of Crimson Haze.

Crimson Haze Boutique tells the poignant tale of an artist's downfall—a cautionary narrative where artistic aspirations crumble under the weight of substance abuse. The canvases that once spoke volumes about Sarah's creativity and emotion now bear witness to the scars left by an addiction that transformed her vibrant life into a shadowed realm of isolation.''',
    '''


Mark, a charismatic and promising young man, succumbs to the allure of the potent substance "Neon Shadows." What begins as a seemingly innocent experiment quickly spirals into a harrowing journey, leaving a trail of destruction in its wake.

As Mark delves deeper into the shadows cast by the substance, his charismatic demeanor gives way to a darker persona. The once-bright future he envisioned becomes clouded by criminal activities that become increasingly difficult to conceal. Neon Shadows, with its potent grip, becomes the catalyst for a series of regrettable choices that shatter the foundations of Mark's life.

Friendships, once solid and dependable, crumble under the weight of Mark's transformation. The people who were once drawn to his charisma and positive energy now recoil from the shadows that envelop him. Neon Shadows becomes the arbiter of isolation as Mark finds himself abandoned by those who can no longer recognize the person he once was.

The estrangement extends to Mark's family, who watch helplessly as their beloved son and brother slips further away from them. The once-close bonds strained to the breaking point as Neon Shadows consumes Mark's identity, replacing it with a distorted version unrecognizable to those who knew him best.

Neon Shadows Emporium unfolds as a cautionary tale, illustrating the insidious impact of substance abuse on an individual's character, relationships, and the fabric of their life. Mark's charismatic spirit becomes a casualty of Neon Shadows, leaving behind a shattered reality that serves as a stark reminder of the perilous nature of succumbing to potent temptations''',
  ];
  var titles = [
    'The Broken Family',
    'The Velvet Spiral',
    'Crimson Haze Boutique',
    'Neon Shadows Emporium'
  ];

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
                    "Real Time Stories",
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
