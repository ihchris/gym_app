import 'package:flutter/material.dart';
import 'globals.dart';

class RemoveUserScreen extends StatefulWidget {
  const RemoveUserScreen({super.key});

  @override
  _RemoveUserScreenState createState() => _RemoveUserScreenState();
}

class _RemoveUserScreenState extends State<RemoveUserScreen> {
  void _removeUser(String username) {
    setState(() {
      users.removeWhere((user) => user['username'] == username);
      saveData(); // Salva os dados
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remover Usuário'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user['username']!),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _removeUser(user['username']!),
            ),
          );
        },
      ),
    );
  }
}
