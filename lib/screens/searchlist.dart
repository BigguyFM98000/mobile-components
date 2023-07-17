import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:slideanimation/models/user.dart';

class UserSearchPage extends StatefulWidget {
  @override
  _UserSearchPageState createState() => _UserSearchPageState();
}

class _UserSearchPageState extends State<UserSearchPage> {
  List<User> userList = [];
  List<User> filteredUserList = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUsers(); // Fetch users from the backend server
  }

  void fetchUsers() async {
    // Make an HTTP request to your backend server to fetch the user list
    // var response = await http.get(Uri.parse('YOUR_BACKEND_URL'));

    // Add dummy data to the userList
    userList = [
      User(name: "John Doe", email: "john.doe@example.com"),
      User(name: "Jane Smith", email: "jane.smith@example.com"),
      User(name: "Alice Johnson", email: "alice.johnson@example.com"),
      User(name: "Bob Williams", email: "bob.williams@example.com"),
      User(name: "Ella Davis", email: "ella.davis@example.com"),
    ];

    setState(() {
      filteredUserList = userList;
    });

    // if (response.statusCode == 200) {
    //   // Parse the response body and create a list of users
    //   List<dynamic> data = jsonDecode(response.body);
    //   userList = data
    //       .map((user) => User(name: user['name'], email: user['email']))
    //       .toList();

    //   setState(() {
    //     filteredUserList = userList;
    //   });
    // } else {
    //   // Handle the error
    //   print('Failed to fetch users');
    // }
  }

  void filterUsers(String searchTerm) {
    if (searchTerm.isNotEmpty) {
      List<User> filteredList = userList
          .where((user) =>
              user.name.toLowerCase().contains(searchTerm.toLowerCase()) ||
              user.email.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();

      setState(() {
        filteredUserList = filteredList;
      });
    } else {
      setState(() {
        filteredUserList = userList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) => filterUsers(value),
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUserList.length,
              itemBuilder: (context, index) {
                User user = filteredUserList[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
