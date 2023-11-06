import 'package:flutter/material.dart';
import 'package:test/view/currency/currency_view.dart';

import 'widget/layout_bottom_navbar.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  PageController pageController = PageController();
  int selectedIndex = 0;
  List<Widget> selectedBody = [
    const CurrencyView(),
    const Center(
      child: Text('Sayfa 2'),
    ),
    const Center(
      child: Text('Sayfa 3'),
    ),
    const Center(
      child: Text('Sayfa 4'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          selectedTitle(selectedIndex),
        ),
      ),
      body: selectedBody[selectedIndex],
      bottomNavigationBar: WidgetBottomNavBar(index: selectedIndex, onChangedTab: onChangedTab),
    );
  }

  void onChangedTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  String selectedTitle(int index) {
    switch (index) {
      case 0:
        return 'Ana Sayfa';
      case 1:
        return 'Sayfa 2';
      case 2:
        return 'Sayfa 3';
      case 3:
        return 'Sayfa 4';
      default:
        return '';
    }
  }
}
