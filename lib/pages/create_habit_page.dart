import 'package:flutter/material.dart';

class CreateHabitPage extends StatefulWidget {
  @override
  _CreateHabitPageState createState() => _CreateHabitPageState();
}

class _CreateHabitPageState extends State<CreateHabitPage> {
  final TextEditingController _habitNameController = TextEditingController();
  String _selectedFrequency = 'Diário';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Novo Hábito'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _habitNameController,
              decoration: InputDecoration(
                labelText: 'Nome do Hábito',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedFrequency,
              items: ['Diário', 'Semanal', 'Mensal']
                  .map((frequency) => DropdownMenuItem(
                        value: frequency,
                        child: Text(frequency),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedFrequency = value!;
                });
              },
              decoration: InputDecoration(
                labelText: 'Frequência',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para criar um novo hábito e salvá-lo no banco de dados
                print('Novo hábito: ${_habitNameController.text}, Frequência: $_selectedFrequency');
              },
              child: Text('Salvar Hábito'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                textStyle: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
