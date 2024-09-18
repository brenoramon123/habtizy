import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // Para converter para JSON

class HabitTracker extends StatefulWidget {
  @override
  _HabitTrackerState createState() => _HabitTrackerState();
}

class _HabitTrackerState extends State<HabitTracker> {
  List habitList = [
    [
      false,
      "Beber Água",
      "Beber pelo menos 8 copos de água",
      const Icon(Icons.local_drink)
    ],
    [
      false,
      "Ler",
      "Ler 25 páginas",
      const Icon(Icons.book)
    ],
    [
      false,
      "Exercitar",
      "Ir pra academia ou fazer cardio",
      const Icon(Icons.sports_gymnastics),
    ],
    [
      false,
      "Aprender Espanhol",
      "Estudar Espanhol por 25 minutos",
      const Icon(Icons.language),
    ],
    [
      false,
      "Codar",
      "Trabalhar no Beach Time",
      const Icon(Icons.computer),
    ],
    [
      false,
      "Diário",
      "Escrever três coisas pelo qual você é grato",
    ],
  ];

  @override
  void initState() {
    super.initState();
    loadHabitList();  
  }

  // Função para salvar a lista de hábitos no SharedPreferences
  Future<void> saveHabitList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Converte a lista de hábitos para JSON antes de salvar
    List<String> encodedList = habitList.map((habit) => jsonEncode(habit)).toList();
    await prefs.setStringList('habitList', encodedList);
    print("Habits saved: $encodedList");  // Log para depuração
  }

  // Função para carregar a lista de hábitos do SharedPreferences
  Future<void> loadHabitList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? loadedList = prefs.getStringList('habitList');

    if (loadedList != null) {
      setState(() {
        // Converte a lista carregada de volta para o formato original
        habitList = loadedList.map((habit) => jsonDecode(habit)).toList();
        print("Habits loaded: $habitList");  // Log para depuração
      });
    } else {
      print("No habits found in SharedPreferences.");  // Caso não haja dados salvos
    }
  }

  // Função para alternar o estado de um hábito (completo/incompleto)
  void toggleHabit(int index) {
    setState(() {
      habitList[index][0] = !habitList[index][0];
    });
    saveHabitList();  // Salva a lista atualizada
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Track de Hábitos")),
      body: ListView.builder(
        itemCount: habitList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: habitList[index][3] ?? Icon(Icons.circle),
            title: Text(habitList[index][1]),
            subtitle: Text(habitList[index][2]),
            trailing: Checkbox(
              value: habitList[index][0],
              onChanged: (value) {
                toggleHabit(index);
              },
            ),
          );
        },
      ),
    );
  }
}
