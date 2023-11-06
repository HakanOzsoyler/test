import 'package:flutter/material.dart';

class WidgetBottomNavBar extends StatefulWidget {
  const WidgetBottomNavBar({
    Key? key,
    required this.index,
    required this.onChangedTab,
  }) : super(key: key);
  final int index;
  final ValueChanged<int> onChangedTab;

  @override
  State<WidgetBottomNavBar> createState() => _WidgetBottomNavBarState();
}

class _WidgetBottomNavBarState extends State<WidgetBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              tabItem(index: 0, icon: const Icon(Icons.home), selectedIcon: const Icon(Icons.home)),
              tabItem(
                  index: 1,
                  icon: const Icon(Icons.ac_unit_outlined),
                  selectedIcon: const Icon(Icons.ac_unit_outlined)),
              tabItem(
                  index: 2,
                  icon: const Icon(Icons.access_alarm),
                  selectedIcon: const Icon(Icons.access_alarm)),
              tabItem(
                  index: 3,
                  icon: const Icon(Icons.access_time),
                  selectedIcon: const Icon(Icons.access_time)),
            ],
          )),
    );
  }

  Widget tabItem({required int index, required Widget icon, required Widget selectedIcon}) {
    final isSelected = index == widget.index;
    return IconTheme(
      data: IconThemeData(color: isSelected ? Colors.blue : Colors.grey),
      child: IconButton(
          onPressed: () {
            setState(() {
              widget.onChangedTab(index);
            });
          },
          icon: isSelected ? selectedIcon : icon),
    );
  }
}
