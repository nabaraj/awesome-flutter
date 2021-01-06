import "package:flutter/material.dart";

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: <Widget>[
        // DrawerHeader(
        //   child: Text(
        //     "Drawer Header",
        //     style: TextStyle(
        //       color: Colors.white,
        //       backgroundColor: Colors.black87,
        //     ),
        //   ),
        //   decoration: BoxDecoration(
        //       color: Colors.indigo,
        //       image: DecorationImage(
        //           fit: BoxFit.cover,
        //           image: NetworkImage(
        //               "https://images.unsplash.com/photo-1574780142136-8deae2a4ab1b?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1189&q=80"))),
        // ),
        UserAccountsDrawerHeader(
          accountName: Text("Nabaraj Saha"),
          accountEmail: Text("nabaraj2k@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1574780142136-8deae2a4ab1b?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1189&q=80"),
          ),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text("Account"),
          subtitle: Text("Personal"),
          trailing: Icon(Icons.edit),
        ),
        ListTile(
          leading: Icon(Icons.email),
          title: Text("Email"),
          subtitle: Text("nabaraj2k@gmail.com"),
          trailing: Icon(Icons.send),
        )
      ]),
    );
  }
}
