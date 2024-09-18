// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  @override
  Widget build(BuildContext context) {
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
        Padding(
          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.white),
            // ignore: prefer_const_literals_to_create_immutables
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 15, 10),
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
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),

            // ignore: prefer_const_literals_to_create_immutables
            child: Column(children: [
              ListTile(
                  leading: CircularProgressIndicator(
                    color: Colors.deepPurpleAccent,
                    strokeWidth: 7.5,
                    backgroundColor: Color.fromARGB(255, 192, 170, 250),
                    value: 1,
                  ),
                  title: Text(
                    "Beber Água",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Quão bem você tem se saído ao beber água esta semana",
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
                  ),
                  trailing: Icon(Icons.local_drink)),
              Divider(),
              ListTile(
                  leading: CircularProgressIndicator(
                    color: Colors.deepPurpleAccent,
                    strokeWidth: 7.5,
                    backgroundColor: Color.fromARGB(255, 192, 170, 250),
                    value: 0.95,
                  ),
                  title: Text(
                    "Leitura",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Quão bem você tem se saído ao ler esta semana",
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
                  ),
                  trailing: Icon(Icons.book)),
              Divider(),
              ListTile(
                  leading: CircularProgressIndicator(
                    color: Colors.deepPurpleAccent,
                    strokeWidth: 7.5,
                    backgroundColor: Color.fromARGB(255, 192, 170, 250),
                    value: 0.8,
                  ),
                  title: Text(
                    "Exercícios",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Quão bem você tem se saído ao se exercitar esta semana",
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
                  ),
                  trailing: Icon(Icons.sports_gymnastics)),
              Divider(),
              ListTile(
                  leading: CircularProgressIndicator(
                    color: Colors.deepPurpleAccent,
                    strokeWidth: 7.5,
                    backgroundColor: Color.fromARGB(255, 192, 170, 250),
                    value: 0.65,
                  ),
                  title: Text(
                    "Estudando Espanhol",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Quão bem você tem se saído ao estudar espanhol esta semana",
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
                  ),
                  trailing: Icon(Icons.language)),
            ]),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 25, 15, 10),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Piores Hábitos Esta Semana",
                style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              )),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),

            // ignore: prefer_const_literals_to_create_immutables
            child: Column(children: [
              ListTile(
                  leading: CircularProgressIndicator(
                    color: Colors.deepPurpleAccent,
                    strokeWidth: 7.5,
                    backgroundColor: Color.fromARGB(255, 192, 170, 250),
                    value: 0.12,
                  ),
                  title: Text(
                    "Programação",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Quão mal você tem se saído na programação esta semana",
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
                  ),
                  trailing: Icon(Icons.computer)),
              Divider(),
              ListTile(
                  leading: CircularProgressIndicator(
                    color: Colors.deepPurpleAccent,
                    strokeWidth: 7.5,
                    backgroundColor: Color.fromARGB(255, 192, 170, 250),
                    value: 0.25,
                  ),
                  title: Text(
                    "Diário",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Quão mal você tem se saído ao escrever no diário esta semana",
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
                  ),
                  trailing: Icon(Icons.edit)),
              Divider(),
              ListTile(
                  leading: CircularProgressIndicator(
                    color: Colors.deepPurpleAccent,
                    strokeWidth: 7.5,
                    backgroundColor: Color.fromARGB(255, 192, 170, 250),
                    value: 0.33,
                  ),
                  title: Text(
                    "Limpeza",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Quão mal você tem se saído na limpeza esta semana",
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
                  ),
                  trailing: Icon(Icons.cleaning_services_outlined)),
              Divider(),
              ListTile(
                  leading: CircularProgressIndicator(
                    color: Colors.deepPurpleAccent,
                    strokeWidth: 7.5,
                    backgroundColor: Color.fromARGB(255, 192, 170, 250),
                    value: 0.33,
                  ),
                  title: Text(
                    "Acordar Cedo",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Quão mal você tem se saído ao acordar cedo esta semana",
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
                  ),
                  trailing: Icon(Icons.language)),
            ]),
          ),
        )
      ]),
    );
  }
}
