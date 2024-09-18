import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './services/habit_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  void addHabit(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController habitNameController = TextEditingController();
        TextEditingController habitDescriptionController = TextEditingController();
        return AlertDialog(
          title: const Text("Adicionar um hábito"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: habitNameController,
                decoration: const InputDecoration(
                  hintText: 'Nome do hábito',
                ),
              ),
              TextFormField(
                controller: habitDescriptionController,
                decoration: const InputDecoration(
                  hintText: 'Descrição do Hábito',
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(habitProvider.notifier).addHabit(
                      habitNameController.text,
                      habitDescriptionController.text,
                      const Icon(Icons.abc),
                    );
                Navigator.pop(context);
              },
              child: const Text("Salvar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habitList = ref.watch(habitProvider);

    final totalHabits = habitList.length;
    final completedHabits = habitList.where((habit) => habit.completed).length;
    final double progress = totalHabits == 0 ? 0.0 : completedHabits / totalHabits;

   return Scaffold(
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: Colors.purple,
        onPressed: () {
          addHabit(context, ref);
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.grey[100],
      body: ListView(padding: EdgeInsets.zero, children: [
        // Cabeçalho e progresso
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Stack(
              children: [
                Image.asset('assets/MainBackground.png'),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 140, 0, 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Hey Breno!",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Você tem $totalHabits hábitos para concluir hoje",
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Barra de Progresso customizada
                        Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 20,
                                width: MediaQuery.of(context).size.width * 0.8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: LinearProgressIndicator(
                                    value: progress,
                                    backgroundColor: Colors.grey[300],
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.greenAccent,
                                    ),
                                    minHeight: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "${(progress * 100).toStringAsFixed(2)}% concluído",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Lista de hábitos
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                habitList.isEmpty
                    ? const Text("Sem hábitos ainda!", style: TextStyle(color: Colors.grey))
                    : ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: habitList.length,
                        itemBuilder: (context, int index) {
                          var habit = habitList[index];
                          return ListTile(
                            title: Text(habit.title),
                            subtitle: Text(habit.description),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                    ref.read(habitProvider.notifier).removeHabit(index);
                                  },
                                ),
                                habit.icon,
                              ],
                            ),
                            leading: Checkbox(
                              value: habit.completed,
                              onChanged: (value) {
                                ref.read(habitProvider.notifier).toggleHabit(index);
                              },
                            ),
                          );
                        },
                      ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
