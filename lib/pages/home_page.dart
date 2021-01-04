import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import '../drawer.dart';
import "dart:convert";
import "dart:math";

class HomePage extends StatefulWidget {
  final String currentTheme = "";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _nameController = TextEditingController();

  var myText = "change me";
  var url = 'https://jsonplaceholder.typicode.com/photos';
  var data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    var res = await http.get(url);

    data = jsonDecode(res.body);
    // print(jsonDecode(res.body));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // return Container(color: Colors.amber, child: Text("Nabaraj Saha"));
    return Scaffold(
        appBar: AppBar(
          title: Text("Awesome App"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: data != null
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: ListTile(
                          title: Text(data[index]["title"]),
                          subtitle: Text("ID: ${data[index]["id"]}"),
                          leading: Image.network(
                              "https://picsum.photos/id/$index/300/300"),
                        ),
                      ),
                    );
                  },
                  itemCount: data.length,
                )
              : Center(child: CircularProgressIndicator()),
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
