import 'package:flutter/material.dart';
import 'package:life_redemption/Home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class doctor extends StatefulWidget {
  final userdata data;
  doctor({required this.data});

  @override
  State<doctor> createState() => _doctorState();
}

class _doctorState extends State<doctor> {
  List<dynamic> suggestions = [];
  TextEditingController tex = TextEditingController();
  String? selectedDoctorData;
  Map<String, dynamic>? doctorDetails;
  String? selectedDoctorarea;
  String? selectedDoctorlocation;
  List<String> doctorNames = [];
  List<String> doctorarea = [];
  List<String> doctorl = [];
  String imageurl = 'assets/images/';

  Future<void> sendDataToFlask(String data) async {
    final String url =
        'http://127.0.0.1:5000/getdoctor'; // Update with your Flask server URL

    Map<String, dynamic> dataToSend = {
      "name": data,
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
        print(responseData["message"]);

        for (var doctorInfo in responseData["message"]) {
          String doctorName = doctorInfo["Doctor Name"] +
              " " +
              doctorInfo["Doctor Area"] +
              " " +
              doctorInfo["Doctor Location"];
          String doctorar = doctorInfo["Doctor Area"];
          String doctorlo = doctorInfo["Doctor Location"];
          doctorNames.add(doctorName);
          doctorarea.add(doctorar);
          doctorl.add(doctorlo);
        }

        setState(() {
          suggestions = doctorNames;
        });
        print("data sent to backend successfully");
      } else {
        print("Error: ${response.reasonPhrase}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> fetchDoctorDetails(String doctorName) async {
    final String url =
        'http://127.0.0.1:5000/getdoctor'; // Update with your Flask server URL

    Map<String, dynamic> dataToSend = {
      "name": doctorName,
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
        setState(() {
          doctorDetails = jsonDecode(response.body);
        });
        print("Doctor details fetched successfully");
      } else {
        print("Error: ${response.reasonPhrase}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

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
                  "Best Councellers and Doctors",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
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
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: tex,
                  onChanged: (input) {
                    setState(() {
                      selectedDoctorData = null;
                      suggestions = [];
                      doctorarea = [];
                      doctorl = [];
                      doctorNames = [];
                    });
                    sendDataToFlask(input);
                  },
                  decoration: InputDecoration(
                    labelText: 'Type something',
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: suggestions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    children: [
                      CircleAvatar(
                        child: Text(suggestions[index][4].toUpperCase()),
                      ),
                      SizedBox(width: 8), // Adjust the spacing as needed
                      Text(suggestions[index]),
                    ],
                  ),
                  onTap: () {
                    tex.text = suggestions[index];
                    setState(() {
                      selectedDoctorData = tex.text;
                      selectedDoctorarea = doctorarea[index];
                      selectedDoctorlocation = doctorl[index];
                      suggestions = [];
                      fetchDoctorDetails(tex.text);
                    });
                    // Do something when a suggestion is tapped
                    // For example, you can populate the text field with the suggestion
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('You tapped ${suggestions[index]}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          if (selectedDoctorData != null && doctorDetails != null)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/myphotom.png'),
                    ),
                    SizedBox(height: 8),
                    Text(
                      selectedDoctorarea!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      selectedDoctorlocation!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      selectedDoctorData!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Add more details as needed
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
