import "package:flutter/material.dart";

void main() {
  runApp(MaterialApp(title: "Awesome App", home: HomePage()));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Container(color: Colors.amber, child: Text("Nabaraj Saha"));
    return Scaffold(
        appBar: AppBar(
          title: Text("Awesome App"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              color: Colors.black,
              width: 200,
              height: 320,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 100, height: 100, color: Colors.green[200]),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.yellow[200],
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
