import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

// Classe Habit que encapsula o hábito e os dados
class Habit {
  bool completed;
  String title;
  String description;
  Icon icon;

  Habit({
    required this.completed,
    required this.title,
    required this.description,
    required this.icon,
  });

  // Convertendo Habit para Map para salvar como JSON
  Map<String, dynamic> toMap() {
    return {
      'completed': completed,
      'title': title,
      'description': description,
      'icon': icon.icon?.codePoint ?? Icons.circle.codePoint,  // Usando ícone padrão se for nulo
    };
  }

  // Convertendo de Map para Habit
  factory Habit.fromMap(Map<String, dynamic> map) {
    return Habit(
      completed: map['completed'],
      title: map['title'],
      description: map['description'],
      icon: Icon(IconData(map['icon'] ?? Icons.circle.codePoint, fontFamily: 'MaterialIcons')),  // Usando ícone padrão se for nulo
    );
  }
}

// Provider para gerenciar os hábitos
class HabitNotifier extends StateNotifier<List<Habit>> {
  HabitNotifier() : super([]) {
    loadHabitList();
  }

  // Carregar a lista de hábitos do SharedPreferences
  Future<void> loadHabitList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? loadedList = prefs.getStringList('habitList');

    if (loadedList != null) {
      state = loadedList.map((habit) => Habit.fromMap(jsonDecode(habit))).toList();
    } else {
      state = [
        Habit(
          completed: false,
          title: "Beber Água",
          description: "Beber pelo menos 8 copos de água",
          icon: const Icon(Icons.local_drink),
        ),
        Habit(
          completed: false,
          title: "Ler",
          description: "Ler 25 páginas",
          icon: const Icon(Icons.book),
        ),
        Habit(
          completed: false,
          title: "Exercitar",
          description: "Ir pra academia ou fazer cardio",
          icon: const Icon(Icons.sports_gymnastics),
        ),
      ];
      saveHabitList(); // Salva a lista inicial
    }
  }

  // Salvar a lista de hábitos no SharedPreferences
  Future<void> saveHabitList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> encodedList = state.map((habit) => jsonEncode(habit.toMap())).toList();
    await prefs.setStringList('habitList', encodedList);
  }

  // Adicionar um novo hábito
  void addHabit(String title, String description, Icon icon) {
    state = [
      ...state,
      Habit(completed: false, title: title, description: description, icon: icon),
    ];
    saveHabitList();
  }

  // Remover hábito
  void removeHabit(int index) {
    state = [...state]..removeAt(index);
    saveHabitList();
  }

  // Alternar o estado de um hábito (completo/incompleto)
  void toggleHabit(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          Habit(
            completed: !state[i].completed,
            title: state[i].title,
            description: state[i].description,
            icon: state[i].icon,
          )
        else
          state[i]
    ];
    saveHabitList();
  }
}

// Definindo o provider global
final habitProvider = StateNotifierProvider<HabitNotifier, List<Habit>>((ref) {
  return HabitNotifier();
});
