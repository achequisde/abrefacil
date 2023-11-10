import 'package:abrefacil/models/api/user.dart';
import 'package:abrefacil/pages/admin.dart';
import 'package:abrefacil/pages/home.dart';
import 'package:flutter/material.dart';

class ParentPage extends StatefulWidget {
  const ParentPage({
    super.key,
    required this.user,
  });

  final User user;

  @override
  State<ParentPage> createState() => _ParentPageState();
}

class _ParentPageState extends State<ParentPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(
        userId: widget.user.id.toString(),
        user: widget.user,
      ),
      AdminPage(
        userId: widget.user.id.toString(),
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, ${widget.user.name}!'),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: pages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (newIndex) => setState(() {
          _currentIndex = newIndex;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configuración',
          ),
        ],
      ),
    );
  }
}
