import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class Profile {
  String firstName;
  String lastName;
  int? age;
  double height;
  Gender gender;
  List<String> hobbies;
  String favoriteProgrammingLanguage;
  String secret;

  Profile(
      {this.firstName = "",
        this.lastName = "",
        this.age,
        this.height = 0.0,
        this.gender = Gender.male,
        this.hobbies = const [],
        this.favoriteProgrammingLanguage = "",
        this.secret = ""});
}

enum Gender { male, female }

class _ProfilePageState extends State<ProfilePage> {
  Profile profile = Profile(
    firstName: "",
    lastName: "",
    gender: Gender.male,
    age: 18,
    height: 101.0,
    hobbies: [],
    favoriteProgrammingLanguage: "",
    secret: "",
  );

  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  List<String> programmingLanguages = ['Dart', 'Java', 'Python'];

  @override
  void initState() {
    super.initState();
    // firstNameController = TextEditingController(text: profile.firstName);
    firstNameController = TextEditingController();
    lastNameController = TextEditingController(text: profile.lastName);
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  void showAgeDialog(BuildContext context, int selectedAge) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(selectedAge < 21 ? "Age too young" : "Age selected"),
          content: Text("You have selected $selectedAge years."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Profile page',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
        toolbarHeight: 60.0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: 300,
                  color: Colors.blueGrey.shade50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.person, size: 25),
                              Text(
                                  '${firstNameController.text} ${profile.lastName}',
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          // SizedBox(width: 40),
                          Text('${profile.age} y/o',
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.arrow_upward, size: 25),
                          Text(profile.height.toStringAsFixed(1),
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.local_activity, size: 25),
                          Text(profile.hobbies.join(', '),
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.code, size: 25),
                          Text(profile.favoriteProgrammingLanguage,
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.lock, size: 25),
                          Text(profile.secret, style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    hintText: 'Enter your first name',
                  ),
                  controller: firstNameController,
                  onSubmitted: ((value) => setState(() {
                        // profile.firstName = value;
                      })),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    hintText: 'Enter your last name',
                  ),
                  onSubmitted: (value) {
                    setState(() {
                      profile.lastName = value;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Age: '),
                    DropdownButton<int>(
                      value: profile.age,
                      onChanged: (newValue) {
                        setState(() {
                          profile.age = newValue!;
                          showAgeDialog(context, newValue);
                        });
                      },
                      items: [
                        DropdownMenuItem<int>(
                          child: Text('Select Age'),
                        ),
                        ...List.generate(83, (index) => 18 + index)
                            .map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                      ],
                    ),
                  ],
                ),
                Slider(
                  value: profile.height,
                  onChanged: (newValue) {
                    setState(() {
                      profile.height = newValue;
                    });
                  },
                  min: 0.0,
                  max: 220.0,
                  divisions: 30,
                  label: profile.height.toStringAsPrecision(3),
                ),
                Text('I like to:'),
                CheckboxListTile(
                  title: Text('Code'),
                  value: profile.hobbies.contains('Code'),
                  onChanged: (newValue) {
                    setState(() {
                      if (newValue!) {
                        profile.hobbies.add('Code');
                      } else {
                        profile.hobbies.remove('Code');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Play video games'),
                  value: profile.hobbies.contains('Play video games'),
                  onChanged: (newValue) {
                    setState(() {
                      if (newValue!) {
                        profile.hobbies.add('Play video games');
                      } else {
                        profile.hobbies.remove('Play video games');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Read'),
                  value: profile.hobbies.contains('Read'),
                  onChanged: (newValue) {
                    setState(() {
                      if (newValue!) {
                        profile.hobbies.add('Read');
                      } else {
                        profile.hobbies.remove('Read');
                      }
                    });
                  },
                ),
                Text('Coding language preference:'),
                Column(
                  children: programmingLanguages
                      .map((language) => RadioListTile<String>(
                            value: language,
                            groupValue: profile.favoriteProgrammingLanguage,
                            onChanged: (newValue) {
                              setState(() {
                                profile.favoriteProgrammingLanguage = newValue!;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Your preference: $newValue'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              });
                            },
                            title: Text(language),
                          ))
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
