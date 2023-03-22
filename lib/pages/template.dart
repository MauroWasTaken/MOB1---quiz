import 'package:flutter/material.dart';

class Template extends StatelessWidget {
  var context;
  static var _currentIndex = 0;

  void _onTap(index) {
    _updateView(
      index,
    );
  }

  void _updateView(index) {
    _currentIndex = index;
  }

  AppBar header(text) {
    return AppBar(
      title: Text(text),
    );
  }

  BottomNavigationBar bottom() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.thumb_up),
          label: 'Like',
        ),
      ],
      currentIndex: _currentIndex,
      onTap: _onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    context = context;
    return const Scaffold();
  }
}
