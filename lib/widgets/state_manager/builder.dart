import 'package:flutter/material.dart';

import 'package:ignite_flutter_todo_list/widgets/state_manager/state_manager.dart';

class StateManagerBuilder<T> extends StatefulWidget {
  const StateManagerBuilder({
    Key? key,
    required this.controller,
    required this.builder,
  }) : super(key: key);

  final StateManager<T> controller;
  final Widget Function(BuildContext context, T state) builder;

  @override
  _StateManagerBuilderState<T> createState() => _StateManagerBuilderState<T>();
}

class _StateManagerBuilderState<T> extends State<StateManagerBuilder<T>> {
  @override
  void initState() {
    widget.controller.listen((state) {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.controller.state);
  }
}
