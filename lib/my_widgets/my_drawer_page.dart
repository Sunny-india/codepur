import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawerPage extends StatelessWidget {
  const MyDrawerPage({super.key});
  static String screenName = '/my_drawer_page';
  @override
  Widget build(BuildContext context) {
    String profileImageUrl =
        'https://images.unsplash.com/photo-1492269815085-88eb3ffe14e5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3538&q=80';
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(color: Colors.deepPurple),
        child: ListView(children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Colors.deepPurple),
                margin: EdgeInsets.zero,
                accountName: const Text('Sunny Chawla'),
                accountEmail: const Text('Sunny@gmail.com'),
                currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(profileImageUrl)),
              )),
          const ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.white),
              )),
          const ListTile(
              leading: Icon(
                CupertinoIcons.person,
                color: Colors.white,
              ),
              title: Text(
                'Profile',
                style: TextStyle(color: Colors.white),
              )),
          const ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                'Email',
                style: TextStyle(color: Colors.white),
              )),
        ]),
      ),
    );
  }
}
