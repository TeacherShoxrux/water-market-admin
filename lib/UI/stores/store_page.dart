import 'package:flutter/material.dart';
import 'package:water_market_admin/UI/stores/widgets/store_add.dart';

class StorePage extends StatelessWidget {
  final List<Map<String, String>> stores = [
    {"name": "Blue Water Supplies", "owner": "Michael Scott", "status": "Active"},
    {"name": "Crystal Clear Waters", "owner": "Pam Beesly", "status": "Inactive"},
    {"name": "Aqua Fresh", "owner": "Jim Halpert", "status": "Active"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WaterMarket"),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return StoreAddAlert();});
                },
              child: Text("Add New Store"),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DropdownButton<String>(
                  hint: Text("Filter by Status"),
                  items: ["Active", "Inactive"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {},
                ),
                SizedBox(width: 10),
                DropdownButton<String>(
                  hint: Text("Filter by Activity Level"),
                  items: ["High", "Low"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {},
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Table(
                    border: TableBorder.all(),
                    columnWidths: {
                      0: FlexColumnWidth(2),
                      1: FlexColumnWidth(2),
                      2: FlexColumnWidth(1),
                      3: FlexColumnWidth(3),
                    },
                    children: [
                      TableRow(
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        children: [
                          tableHeader("Store Name"),
                          tableHeader("Owner"),
                          tableHeader("Status"),
                          tableHeader("Actions"),
                        ],
                      ),
                      ...stores.map((store) => tableRow(store, context)).toList(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tableHeader(String text) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  TableRow tableRow(Map<String, String> store, BuildContext context) {
    return TableRow(
      children: [
        tableCell(store["name"] ?? ""),
        tableCell(store["owner"] ?? ""),
        tableCell(store["status"] ?? ""),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            actionButton("Edit", Colors.blue, () {}),
            SizedBox(width: 5),
            actionButton(
              store["status"] == "Active" ? "Deactivate" : "Activate",
              Colors.grey,
                  () {},
            ),
            SizedBox(width: 5),
            actionButton("Delete", Colors.red, () {}),
          ],
        ),
      ],
    );
  }

  Widget tableCell(String text) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(text),
    );
  }

  Widget actionButton(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }
}
