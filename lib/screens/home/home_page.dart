import 'package:flutter/material.dart';

import 'package:ignite_flutter_todo_list/screens/home/home_controller.dart';

import 'package:ignite_flutter_todo_list/screens/done_screen.dart';
import 'package:ignite_flutter_todo_list/screens/task_screen.dart';

import 'package:ignite_flutter_todo_list/shared/models/todo_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  final _pageViewController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  var _selectedIndex = 0;

  @override
  void dispose() {
    _pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageViewController,
        children: <Widget>[
          TaskScreen(
            itemList: controller.todoItemList,
            onAddItem: controller.onAddItem,
            onCompleteItem: controller.onCompleteItem,
            onRemoveItem: controller.onRemoveToDoItem,
            homeController: controller,
          ),
          DoneScreen(
            itemList: controller.doneItemList,
            onRemoveItem: controller.onRemoveDoneItem,
            onResetItem: controller.onResetItem,
          ),
        ],
        onPageChanged: (index) {
          setState(() => _selectedIndex = index);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);

          _pageViewController.animateToPage(
            _selectedIndex,
            duration: Duration(milliseconds: 350),
            curve: Curves.easeOut,
          );
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outline_blank),
            label: 'Pendentes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: 'Concluídas',
          ),
        ],
      ),
    );
  }
}
