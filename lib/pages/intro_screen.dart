import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import './intro_widget.dart';
import "signin.dart";

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  int _activePage = 0;

void onNextPage() {
  if (_activePage < _pages.length - 1) {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  } else {
    // Navega para a página de login ao final do onboarding
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SignInPage()),
    );
  }
}

 final List<Map<String, dynamic>> _pages = [
  {
    'color': '#ffe24e',
    'title': 'Hábitos Saudáveis',
    'image': 'assets/image1.png',
    'description': 'Adote uma rotina de hábitos saudáveis para uma vida melhor.',
    'skip': true
  },
  {
    'color': '#a3e4f1',
    'title': 'Foco e Consistência',
    'image': 'assets/image2.png',
    'description': 'Mantenha o foco e construa consistência em seus hábitos diários.',
    'skip': true
  },
  {
    'color': '#31b77a',
    'title': 'Acompanhe seu Progresso',
    'image': 'assets/image3.png',
    'description': 'Veja seu progresso e celebre suas conquistas ao longo do caminho.',
    'skip': true
  },
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              scrollBehavior: AppScrollBehavior(),
              onPageChanged: (int page) {
                setState(() {
                  _activePage = page;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return IntroWidget(
                  index: index,
                  color: _pages[index]['color'],
                  title: _pages[index]['title'],
                  description: _pages[index]['description'],
                  image: _pages[index]['image'],
                  skip: _pages[index]['skip'],
                  onTab: onNextPage,
                );
              }),
          Positioned(
            top: MediaQuery.of(context).size.height / 1.75,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildIndicator())
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildIndicator() {
    final indicators = <Widget>[];

    for (var i = 0; i < _pages.length; i++) {
      if (_activePage == i) {
        indicators.add(_indicatorsTrue());
      } else {
        indicators.add(_indicatorsFalse());
      }
    }
    return indicators;
  }

  Widget _indicatorsTrue() {
    final String color;
    if (_activePage == 0) {
      color = '#ffe24e';
    } else if (_activePage == 1) {
      color = '#a3e4f1';
    } else {
      color = '#31b77a';
    }

    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: 6,
      width: 42,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: hexToColor(color),
      ),
    );
  }

  Widget _indicatorsFalse() {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: 8,
      width: 8,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey.shade100,
      ),
    );
  }
}
