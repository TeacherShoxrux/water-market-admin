import 'package:flutter/material.dart';

import '../deliver/deliver_page.dart';
import '../home/home_page.dart';
import '../stores/store_page.dart';
import '../users/users_screen.dart';

class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    StorePage(),
    ManageDriversPage(),
    UsersPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HEMIS OTM"),
        backgroundColor: Colors.blueGrey,
      ),
      drawer: AdminDrawer(onItemTapped: _onItemTapped),
      body: _pages[_selectedIndex],
    );
  }
}

class AdminDrawer extends StatelessWidget {
  final Function(int) onItemTapped;

  AdminDrawer({required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text("HEMIS OTM", style: TextStyle(fontSize: 20, color: Colors.white)),
            decoration: BoxDecoration(color: Colors.blueGrey),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text("Dashboard"),
            onTap: () => onItemTapped(0),
          ),
          ListTile(
            leading: Icon(Icons.store),
            title: Text("Stores"),
            onTap: () => onItemTapped(1),
          ),
          ListTile(
            leading: Icon(Icons.delivery_dining),
            title: Text("Deliver"),
            onTap: () => onItemTapped(2),
          ),
          ListTile(
            leading: Icon(Icons.supervised_user_circle),
            title: Text("Users"),
            onTap: () => onItemTapped(3),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () => onItemTapped(4),
          ),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Dars o'tish jadvali", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Expanded(
            child: DataTable(
              columns: [
                DataColumn(label: Text("#")),
                DataColumn(label: Text("O'quv yili")),
                DataColumn(label: Text("Semestr")),
                DataColumn(label: Text("Guruh")),
                DataColumn(label: Text("Dars sanasi")),
                DataColumn(label: Text("Fanlar")),
              ],
              rows: List.generate(10, (index) => DataRow(cells: [
                DataCell(Text("${index + 1}")),
                DataCell(Text("2024-2025")),
                DataCell(Text(index % 2 == 0 ? "1-semestr" : "9-semestr")),
                DataCell(Text("13B-24 TJA")),
                DataCell(Text("09.09.2024", style: TextStyle(color: Colors.green))),
                DataCell(Text("Dasturlash")),
              ])),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Sozlamalar sahifasi"));
  }
}
