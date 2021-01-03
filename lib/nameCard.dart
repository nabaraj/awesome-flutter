import 'package:awesapp/bg_image.dart';
import "package:flutter/material.dart";

class NameCard extends StatelessWidget {
  const NameCard({
    Key key,
    @required this.myText,
    @required TextEditingController nameController,
  })  : _nameController = nameController,
        super(key: key);

  final String myText;
  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        BgImage(),
        SizedBox(height: 20),
        Text(
          myText,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              controller: _nameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: "enter something here",
                  border: OutlineInputBorder(),
                  labelText: "Name")),
        )
      ],
    ));
  }
}
