import 'package:flutter/material.dart';
import 'globals.dart';

class ViewWorkoutPlanScreen extends StatelessWidget {
  final String username;

  const ViewWorkoutPlanScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final userPlans =
        workoutPlans.where((plan) => plan.startsWith('$username:')).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Plano de Treino de $username'),
      ),
      body: ListView.builder(
        itemCount: userPlans.length,
        itemBuilder: (context, index) {
          final plan = userPlans[index].replaceFirst('$username: ', '');
          return ListTile(
            title: Text(plan),
          );
        },
      ),
    );
  }
}
