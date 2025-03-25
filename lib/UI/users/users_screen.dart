import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}
class _UsersPageState extends State<UsersPage> {
  final List<Map<String, String>> users = [
    {"name": "Alice Johnson", "email": "alice.johnson@example.com", "role": "Customer", "status": "Active"},
    {"name": "Bob Smith", "email": "bob.smith@example.com", "role": "Store Owner", "status": "Inactive"},
    {"name": "Charlie Brown", "email": "charlie.brown@example.com", "role": "Delivery Driver", "status": "Active"},
    {"name": "Diana Prince", "email": "diana.prince@example.com", "role": "Customer", "status": "Active"},
  ];

  String selectedRole = "All Roles";
  String selectedStatus = "All Statuses";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Management")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                DropdownButton<String>(
                  value: selectedRole,
                  onChanged: (newValue) {
                    setState(() {
                      selectedRole = newValue!;
                    });
                  },
                  items: ["All Roles", "Customer", "Store Owner", "Delivery Driver"]
                      .map((role) => DropdownMenuItem(value: role, child: Text(role)))
                      .toList(),
                ),
                SizedBox(width: 16),
                DropdownButton<String>(
                  value: selectedStatus,
                  onChanged: (newValue) {
                    setState(() {
                      selectedStatus = newValue!;
                    });
                  },
                  items: ["All Statuses", "Active", "Inactive"]
                      .map((status) => DropdownMenuItem(value: status, child: Text(status)))
                      .toList(),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: Card(
                elevation: 4,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text("Name")),
                    DataColumn(label: Text("Email")),
                    DataColumn(label: Text("Role")),
                    DataColumn(label: Text("Status")),
                    DataColumn(label: Text("Actions")),
                  ],
                  rows: users
                      .where((user) =>
                  (selectedRole == "All Roles" || user["role"] == selectedRole) &&
                      (selectedStatus == "All Statuses" || user["status"] == selectedStatus))
                      .map(
                        (user) => DataRow(
                      cells: [
                        DataCell(Text(user["name"]!)),
                        DataCell(Text(user["email"]!, style: TextStyle(color: Colors.blue))),
                        DataCell(Text(user["role"]!)),
                        DataCell(Text(user["status"]!)),
                        DataCell(
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit, color: Colors.blue),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.visibility, color: Colors.blue),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}