import 'package:flutter/material.dart';

class InvitesListView extends StatefulWidget {
  const InvitesListView({super.key});

  @override
  State<InvitesListView> createState() => _InvitesListViewState();
}

class _InvitesListViewState extends State<InvitesListView> {
  List<Invite> inviteList = [];

  Invite invite1 = Invite(
    "John Doe",
    "123456789",
    "john@example.com",
    "Hello, World!",
  );

  Invite invite2 = Invite(
    "Fhatuwani",
    "0606909813",
    "fhatuwani@gmail.com",
    "In Loving of Thando!",
  );
  Invite invite3 = Invite(
    "John Does",
    "123456789",
    "john@example.com",
    "Hello, World!",
  );

  @override
  Widget build(BuildContext context) {
    inviteList.add(invite1);
    inviteList.add(invite2);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invite List'),
      ),
      body: ListView.builder(
        itemCount: inviteList.length,
        itemBuilder: (context, index) {
          Invite invite = inviteList[index];
          return ListTile(
            title: Text(invite.name),
            subtitle: Text(invite.email),
            trailing: Text(invite.phoneNumber),
          );
        },
      ),
    );
  }
}

class Invite {
  String name;
  String phoneNumber;
  String email;
  String message;

  Invite(this.name, this.phoneNumber, this.email, this.message);
}
