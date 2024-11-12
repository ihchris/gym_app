import 'package:flutter/material.dart';
import 'globals.dart';

class ManageWorkoutPlansScreen extends StatefulWidget {
  const ManageWorkoutPlansScreen({super.key});

  @override
  _ManageWorkoutPlansScreenState createState() =>
      _ManageWorkoutPlansScreenState();
}

class _ManageWorkoutPlansScreenState extends State<ManageWorkoutPlansScreen> {
  final TextEditingController planController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  String? selectedUser;
  List<Map<String, String>> filteredUsers = users;

  @override
  void initState() {
    super.initState();
    filteredUsers = users;
  }

  void _addPlan() {
    final plan = planController.text;

    if (plan.isNotEmpty && selectedUser != null) {
      setState(() {
        // Adiciona o plano de treino ao usuário selecionado
        workoutPlans.add('$selectedUser: $plan');
        saveData(); // Salva os dados
      });
      planController.clear();
    }
  }

  void _removePlan(String plan) {
    setState(() {
      workoutPlans.remove(plan);
      saveData(); // Salva os dados
    });
  }

  void _filterUsers(String query) {
    setState(() {
      filteredUsers = users.where((user) {
        final usernameLower = user['username']!.toLowerCase();
        final queryLower = query.toLowerCase();
        return usernameLower.contains(queryLower);
      }).toList();

      // Redefinir selectedUser se não estiver presente na lista filtrada
      if (selectedUser != null &&
          !filteredUsers.any((user) => user['username'] == selectedUser)) {
        selectedUser = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Planos de Treino'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'Pesquisar Usuário',
                border: OutlineInputBorder(),
              ),
              onChanged: _filterUsers,
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
              hint: const Text('Selecione o usuário'),
              value: selectedUser,
              onChanged: (String? newValue) {
                setState(() {
                  selectedUser = newValue;
                });
              },
              items: filteredUsers
                  .map<DropdownMenuItem<String>>((Map<String, String> user) {
                return DropdownMenuItem<String>(
                  value: user['username'],
                  child: Text(user['username']!),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: planController,
              decoration: const InputDecoration(
                labelText: 'Novo Plano de Treino',
                border: OutlineInputBorder(),
              ),
              maxLines: null, // Permite múltiplas linhas
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addPlan,
              child: const Text('Adicionar Plano'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: workoutPlans.length,
                itemBuilder: (context, index) {
                  final plan = workoutPlans[index];
                  return Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      title: Text(plan),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _removePlan(plan),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
