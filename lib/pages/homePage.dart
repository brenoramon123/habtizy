import 'package:flutter/material.dart';
import './services/lists.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  // Função para adicionar um hábito à lista
  void addToHabitList(String habitName, String habitDescription) {
    habitList.add([false, habitName, habitDescription, const Icon(Icons.abc)]);
  }

  // Função para remover um hábito da lista
  void removeHabit(int index) {
    setState(() {
      if (habitList[index][0] == true) {
        // Se o hábito estiver marcado como concluído, decrementa o contador
        counter -= 1;
      }
      habitList.removeAt(index);
    });
  }

  // Função para exibir o diálogo de adicionar hábito
  void addHabit(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          TextEditingController habitNameController =
              TextEditingController();
          TextEditingController habitDescriptionController =
              TextEditingController();
          return AlertDialog(
            title: const Text("Adicionar um hábito"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: habitNameController,
                  decoration: const InputDecoration(
                    hintText: 'Nome do hábito'
                  ),
                ),
                TextFormField(
                  controller: habitDescriptionController,
                  decoration: const InputDecoration(
                    hintText: 'Descrição do Hábito'
                  ),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 224, 223, 226)),
                      surfaceTintColor: WidgetStateProperty.all(Colors.purpleAccent)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 224, 223, 226)),
                      surfaceTintColor: WidgetStateProperty.all(Colors.purpleAccent)),
                  onPressed: () {
                    setState(() {
                      addToHabitList(habitNameController.text, habitDescriptionController.text);
                    });
                    Navigator.pop(context);
                  },
                  child: const Text("Salvar"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: Colors.purple,
        onPressed: (() {
          addHabit(context);
        }),
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.grey[100],
      body: ListView(padding: EdgeInsets.zero, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Stack(children: [
              Image.asset('assets/MainBackground.png'),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 140, 0, 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(children: [
                    const Text(
                      "Hey Breno!",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Vocẽ Tem ${habitList.length - counter} Hábitos para concluir hoje",
                      style: const TextStyle(
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
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Continue Firme!",
                        style: TextStyle(color: Colors.grey[600], fontSize: 16),
                      ),
                      Text(habitList.isEmpty
                          ? "0%"
                          : "${((counter / habitList.length) * 100).round()}%",
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 16))
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                        minHeight: 12,
                        color: Colors.deepPurpleAccent,
                        backgroundColor: const Color.fromARGB(255, 192, 170, 250),
                        value: habitList.isEmpty
                            ? 0
                            : (counter / habitList.length)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Divider(),
                ),
                habitList.isEmpty
                    ? const Text("Sem hábitos ainda!",
                        style: TextStyle(color: Colors.grey))
                    : ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: habitList.length,
                        itemBuilder: (context, int index) {
                          return ListTile(
                            title: Text(habitList[index][1]),
                            subtitle: Text(habitList[index][2]),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                    removeHabit(index);
                                  },
                                ),
                                habitList[index][3],
                              ],
                            ),
                            leading: Checkbox(
                              value: habitList[index][0],
                              onChanged: ((value) {
                                setState(() {
                                  if (value == false) {
                                    counter -= 1;
                                    habitList[index][0] = value;
                                  } else {
                                    counter += 1;
                                    habitList[index][0] = value;
                                  }
                                });
                              }),
                            ),
                          );
                        },
                      )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
