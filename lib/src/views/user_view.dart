import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/user_viewmodel.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserViewModel>(context, listen: false).fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: userViewModel.users.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: userViewModel.users.length,
              itemBuilder: (context, index) {
                final user = userViewModel.users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                );
              },
            ),
    );
  }
}
