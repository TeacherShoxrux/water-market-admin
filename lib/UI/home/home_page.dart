import 'package:flutter/material.dart';
import 'package:water_market_admin/UI/home/widgets/activity.dart';
import 'package:water_market_admin/UI/home/widgets/dashboard.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DashboardCard(title: "Total Orders", value: "1,234"),
              DashboardCard(title: "Active Stores", value: "56"),
              DashboardCard(title: "Registered Customers", value: "7,890"),
              DashboardCard(title: "Available Drivers", value: "123"),
            ],
          ),
          SizedBox(height: 20),
          Text("Recent Activity", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                ActivityTile("New order placed by Alice Johnson - 2 hours ago"),
                ActivityTile("New user registered: Mark Spencer - 3 hours ago"),
                ActivityTile("Order #1234 delivered - 5 hours ago"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}