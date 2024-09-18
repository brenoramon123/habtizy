// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.fromLTRB(15, 50, 15, 20),
        children: [
          CircleAvatar(
            radius: 150,
            backgroundColor: Colors.purpleAccent,
            backgroundImage: NetworkImage(
                'https://cdn2.iconfinder.com/data/icons/avatars-60/5985/12-Delivery_Man-512.png'),
          ),
          // ignore: prefer_const_constructors
          Padding(
            padding: EdgeInsets.only(top: 25, bottom: 10),
            child: const Center(
                child: Text(
              "Olá, Breno!",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            )),
          ),
          Center(
              child: Text(
            "Que dia maravilhoso!!",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
          )),
          Padding(
            padding: EdgeInsets.all(10),
            child: Divider(),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Informações da Conta"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text("Informações da Assinatura"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.list),
            title: Text("Todos os meus hábitos"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("Sobre este Aplicativo"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          Center(
            child: TextButton(
              onPressed: (() {
                print("Usuário desconectado");
              }),
              child: Text(
                "Sair",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
