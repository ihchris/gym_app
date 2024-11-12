import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

List<Map<String, String>> users = [
  {'username': 'admin', 'password': 'admin'},
  {'username': 'user', 'password': 'user'},
];

List<String> workoutPlans = [];

Future<void> saveData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('users', jsonEncode(users));
  prefs.setString('workoutPlans', jsonEncode(workoutPlans));
  print('Dados salvos: $users, $workoutPlans');
}

Future<void> loadData() async {
  final prefs = await SharedPreferences.getInstance();
  final String? usersString = prefs.getString('users');
  final String? workoutPlansString = prefs.getString('workoutPlans');

  if (usersString != null) {
    List<dynamic> decodedUsers = jsonDecode(usersString);
    users = decodedUsers.map((user) => Map<String, String>.from(user)).toList();
  }

  if (workoutPlansString != null) {
    workoutPlans = List<String>.from(jsonDecode(workoutPlansString));
  }

  print('Dados carregados: $users, $workoutPlans');
}
