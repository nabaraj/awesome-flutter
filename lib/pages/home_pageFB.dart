import 'package:awesapp/utils/Constants.dart';
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import '../widget/drawer.dart';
import "dart:convert";

class HomePageFB extends StatelessWidget {
  Future getData() async {
    var res = await http.get('https://jsonplaceholder.typicode.com/photos');
    var data = jsonDecode(res.body);
    print(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    // return Container(color: Colors.amber, child: Text("Nabaraj Saha"));
    return Scaffold(
        appBar: AppBar(
          title: Text("Awesome App"),
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Constants.prefs.setBool('loggedIn', false);
                Navigator.pushReplacementNamed(context, '/login');
              },
            )
          ],
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Text('Fatch somethin'),
                );
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Some error occured'),
                  );
                }
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: ListTile(
                          title: Text(snapshot.data[index]["title"]),
                          subtitle: Text("ID: ${snapshot.data[index]["id"]}"),
                          leading: Image.network(
                              "https://picsum.photos/id/$index/300/300"),
                        ),
                      ),
                    );
                  },
                  itemCount: snapshot.data.length,
                );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // myText = _nameController.text;
            // setState(() {});
          },
          child: Icon(Icons.refresh),
          mini: true,
        ),
        drawer: MyDrawer());
  }
}
