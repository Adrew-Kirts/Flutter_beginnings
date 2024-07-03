import 'package:flutter/material.dart';

class LayoutExoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  color: Colors.blue,
                  height: 150,
                  width: MediaQuery.of(context).size.width / 2,
                ),
                Container(
                  color: Colors.red,
                  height: 150,
                  width: MediaQuery.of(context).size.width / 2,
                ),
              ],
            ),
            Container(
              color: Colors.green,
              height: 150,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      color: Colors.cyan,
                      height: 200,
                      width: MediaQuery.of(context).size.width / 3,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      color: Colors.black,
                      height: 200,
                      width: MediaQuery.of(context).size.width / 3,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          color: Colors.yellow,
                          height: 50,
                          width: MediaQuery.of(context).size.width / 3,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          color: Colors.pink,
                          height: 50,
                          width: MediaQuery.of(context).size.width / 3,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          color: Colors.purple,
                          height: 50,
                          width: MediaQuery.of(context).size.width / 3,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          color: Colors.orange,
                          height: 50,
                          width: MediaQuery.of(context).size.width / 3,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Container(
              color: Colors.brown,
              height: 150,
            )
          ],
        ),
      ),
    );
  }
}