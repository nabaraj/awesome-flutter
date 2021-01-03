import "package:flutter/material.dart";

import '../drawer.dart';
import '../nameCard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _nameController = TextEditingController();
  var myText = "change me";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Container(color: Colors.amber, child: Text("Nabaraj Saha"));
    return Scaffold(
        appBar: AppBar(
          title: Text("Awesome App"),
        ),
        body: SingleChildScrollView(
          child: NameCard(myText: null, nameController: null),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            myText = _nameController.text;
            setState(() {});
          },
          child: Icon(Icons.refresh),
          mini: true,
        ),
        drawer: MyDrawer());
  }
}
