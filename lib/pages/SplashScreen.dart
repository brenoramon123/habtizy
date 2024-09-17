import 'package:flutter/material.dart';
import 'habit_selection_page.dart'; // Importa a página de seleção de hábitos

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bem-vindo ao Criador de Hábitos!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navega para a página de seleção de hábitos
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HabitSelectionPage(),
                  ),
                );
              },
              child: Text('Começar'),
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
