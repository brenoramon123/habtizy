import 'package:flutter/material.dart';
import 'create_habit_page.dart'; // Importa a página de criação de hábito

class HabitSelectionPage extends StatelessWidget {
  final List<String> predefinedHabits = [
    'Beber água',
    'Meditar',
    'Exercitar-se',
    'Ler',
    'Dormir cedo'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecione um Hábito'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Escolha um hábito para começar:',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: predefinedHabits.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(predefinedHabits[index]),
                  onTap: () {
                    // Lógica para selecionar o hábito e começar a monitorar
                    print('Hábito selecionado: ${predefinedHabits[index]}');
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Navega para a página de criação de hábito
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateHabitPage(),
                  ),
                );
              },
              child: Text('Criar Novo Hábito'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                textStyle: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
