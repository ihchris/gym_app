import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'globals.dart';

class UserScreen extends StatelessWidget {
  final String username;

  const UserScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    // Filtrar os planos de treino do usuário logado
    final userPlans =
        workoutPlans.where((plan) => plan.startsWith('$username:')).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Planos de Treino'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: userPlans.length,
          itemBuilder: (context, index) {
            final plan = userPlans[index].replaceFirst('$username: ', '');
            return Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListTile(
                title: Text(plan),
              ),
            );
          },
        ),
      ),
    );
  }
}
