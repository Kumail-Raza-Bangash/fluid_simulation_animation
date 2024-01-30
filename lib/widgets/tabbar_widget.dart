import 'package:flutter/material.dart';
import 'package:flutter_caller_theme_01/provider/tab_provider.dart';
import 'package:provider/provider.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    final tabProvider = Provider.of<TabProvider>(context);

    return DefaultTabController(
      length: 5, // Number of tabs
      initialIndex: tabProvider.currentIndex,
      child: Column(
        children: [
          TabBar(
            tabs: const [
              Tab(text: 'ALL'),
              Tab(text: 'VIP'),
              Tab(text: 'NEW'),
              Tab(text: 'TRENDING'),
              Tab(text: 'FEATURE'),
            ],
            indicator: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 3.0,
                ),
              ),
            ),
            labelColor: Colors.black, // Active tab color
            unselectedLabelColor: Colors.grey, // Default tab color
            onTap: (index) {
              tabProvider.setTabIndex(index);
            },
          ),
        ],
      ),
    );
  }
}