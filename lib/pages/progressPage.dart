import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './services/habit_provider.dart';

class ProgressPage extends ConsumerWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habitList = ref.watch(habitProvider);  // Acessando os hábitos

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(padding: EdgeInsets.zero, children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Stack(children: [
              Image.asset('assets/progressPageBackground.png'),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 140, 0, 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(children: const [
                    Text(
                      "Olá Breno!",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Continue assim, campeão!",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ]),
                ),
              )
            ]),
          ),
        ),

        // Seção de hábitos principais
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 15, 10),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Hábitos Principais Esta Semana",
                style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Column(
              children: habitList.isEmpty
                  ? [
                      const Center(
                        child: Text("Sem hábitos ainda!", style: TextStyle(color: Colors.grey)),
                      )
                    ]
                  : List.generate(habitList.length, (index) {
                      final habit = habitList[index];
                      final progress = habit.completed ? 1.0 : 0.7; // Exemplo de valor de progresso
                      return Column(
                        children: [
                          ListTile(
                            leading: CircularProgressIndicator(
                              color: Colors.deepPurpleAccent,
                              strokeWidth: 7.5,
                              backgroundColor: const Color.fromARGB(255, 192, 170, 250),
                              value: progress,  // Progresso do hábito
                            ),
                            title: Text(
                              habit.title,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "Progresso do hábito: ${habit.title}",
                              style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
                            ),
                            trailing: habit.icon,
                          ),
                          const Divider(),
                        ],
                      );
                    }),
            ),
          ),
        ),

        // Seção de piores hábitos
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 25, 15, 10),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Piores Hábitos Esta Semana",
                style: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Column(
              children: habitList.isEmpty
                  ? [
                      const Center(
                        child: Text("Sem hábitos ainda!", style: TextStyle(color: Colors.grey)),
                      )
                    ]
                  : List.generate(habitList.length, (index) {
                      final habit = habitList[index];
                      final progress = habit.completed ? 1.0 : 0.3; // Exemplo de valor de progresso para piores hábitos
                      return Column(
                        children: [
                          ListTile(
                            leading: CircularProgressIndicator(
                              color: Colors.deepPurpleAccent,
                              strokeWidth: 7.5,
                              backgroundColor: const Color.fromARGB(255, 192, 170, 250),
                              value: progress,  // Progresso para hábitos menos cumpridos
                            ),
                            title: Text(
                              habit.title,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "Progresso do hábito: ${habit.title}",
                              style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
                            ),
                            trailing: habit.icon,
                          ),
                          const Divider(),
                        ],
                      );
                    }),
            ),
          ),
        ),
      ]),
    );
  }
}
