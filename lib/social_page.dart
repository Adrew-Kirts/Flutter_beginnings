import 'package:flutter/material.dart';

class SocialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Profile',
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
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width,
                        ),
                        child: Image(
                          height: 200,
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://i.icanvas.com/list-hero/scenic-snowy-mountains.jpg',),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 150.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 52,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                                'https://static2.bigstockphoto.com/6/6/3/large1500/366849577.jpg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5),
              Title(
                color: Colors.black,
                child: Text('Jane Doe',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    )),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam, quis nostrud exercitation',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.italic,
                    fontSize: 17,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: null,
                    style: ButtonStyle(
                      minimumSize: WidgetStateProperty.all(Size(200, 50)),
                      foregroundColor: WidgetStateProperty.all(Colors.blue),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17.0))),
                          side: WidgetStateProperty.all(BorderSide(color: Colors.blue)),
                    ),
                    child: const Text("Modifier le profil",
                      ),
                  ),
                  OutlinedButton(
                    onPressed: null,
                    style: ButtonStyle(
                      minimumSize: WidgetStateProperty.all(Size(100, 50)),
                      backgroundColor: WidgetStateProperty.all(Colors.blue),
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17.0))),
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(
                color: Colors.grey.shade400,
                thickness: 1,
                indent: 15,
                endIndent: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Title(
                      color: Colors.black,
                      child: Text('A propos de moi ...',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on, color: Colors.black),
                        SizedBox(width: 5),
                        Text('Annecy le Vieux, France',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 15,
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.work, color: Colors.black),
                        SizedBox(width: 5),
                        Text('Développeuse polyvalente',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 15,
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.heart_broken, color: Colors.black),
                        SizedBox(width: 5),
                        Text("C'est compliqué..",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Divider(
                color: Colors.grey.shade400,
                thickness: 1,
                indent: 15,
                endIndent: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Title(
                      color: Colors.black,
                      child: Text('Amis',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: Colors.grey.shade300, // Border color
                          width: 5, // Border width
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          'https://www.studioepic.com/blog/blog_images/1_Black_Girl_Casual_Profile_Picture.jpg',
                          fit: BoxFit.cover,
                          height: 180,
                          width: 100,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: Colors.grey.shade300, // Border color
                          width: 5, // Border width
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          'https://writestylesonline.com/wp-content/uploads/2020/01/Three-Things-To-Consider-When-Deciding-On-Your-LinkedIn-Profile-Picture_thumbnail.jpg',
                          fit: BoxFit.cover,
                          height: 180,
                          width: 100,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: Colors.grey.shade300, // Border color
                          width: 5, // Border width
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          'https://previews.123rf.com/images/rido/rido1907/rido190700033/127284795-confident-young-man-looking-away-with-big-smile-happy-handsome-guy-looking-through-window-thinking.jpg',
                          fit: BoxFit.cover,
                          height: 180,
                          width: 100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Divider(
                color: Colors.grey.shade400,
                thickness: 1,
                indent: 15,
                endIndent: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Title(
                      color: Colors.black,
                      child: Text('Feed',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } // build
} // SocialPage
