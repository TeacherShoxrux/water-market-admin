import 'package:flutter/material.dart';

class ManageDriversPage extends StatefulWidget {
  @override
  _ManageDriversPageState createState() => _ManageDriversPageState();
}

class _ManageDriversPageState extends State<ManageDriversPage> {
  String selectedAvailability = "Active";
  final TextEditingController storeController = TextEditingController();

  List<Map<String, String>> drivers = [
    {"name": "Alex Johnson", "store": "Northside Water Depot", "status": "Active"},
    {"name": "Jessica Lee", "store": "Eastside Water Hub", "status": "Inactive"},
    {"name": "Michael Smith", "store": "Central Water Station", "status": "Active"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WaterMarket Admin"),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("Upload Store Logo", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Manage Delivery Drivers", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: storeController,
                    decoration: InputDecoration(
                      labelText: "Filter by Store",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                DropdownButton<String>(
                  value: selectedAvailability,
                  onChanged: (newValue) {
                    setState(() {
                      selectedAvailability = newValue!;
                    });
                  },
                  items: ["Active", "Inactive"]
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
                    DataColumn(label: Text("Driver Name")),
                    DataColumn(label: Text("Assigned Store")),
                    DataColumn(label: Text("Status")),
                    DataColumn(label: Text("Actions")),
                  ],
                  rows: drivers
                      .map(
                        (driver) => DataRow(
                      cells: [
                        DataCell(Text(driver["name"]!)),
                        DataCell(Text(driver["store"]!)),
                        DataCell(Text(driver["status"]!)),
                        DataCell(
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text("Edit"),
                              ),
                              SizedBox(width: 8),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
                                child: Text("Remove"),
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
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Add New Driver"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text("Save Store Configuration", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}