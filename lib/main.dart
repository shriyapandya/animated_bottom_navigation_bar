import 'package:flutter/material.dart';
import 'floating_nav_item.dart';
import 'floating_navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _index = 0;
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 1), // Start position (bottom of the screen)
      end: Offset.zero, // End position (center of the screen)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation when the widget is built
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.amber[50],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Container(
            margin: const EdgeInsets.only(left: 18),
            child: const Text(
              'Home Page',
              style:
                  TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        bottomNavigationBar: SlideTransition(
          position: _animation,
          child: FloatingNavbar(
            onTap: (int val) => setState(() => _index = val),
            currentIndex: _index,
            backgroundColor: Colors.black.withOpacity(0.8),
            items: [
              FloatingNavbarItem(icon: Icons.search_rounded),
              FloatingNavbarItem(icon: Icons.message_rounded),
              FloatingNavbarItem(icon: Icons.pentagon_rounded),
              FloatingNavbarItem(icon: Icons.favorite_rounded),
              FloatingNavbarItem(icon: Icons.person),
            ],
          ),
        ));
  }
}
