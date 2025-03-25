import 'package:flutter/material.dart';
class StoreAddAlert extends StatelessWidget {
  const StoreAddAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Store'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Store Name'),
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Store Owner'),
              items: [
                DropdownMenuItem(child: Text('Owner 1'), value: 'owner1'),
                DropdownMenuItem(child: Text('Owner 2'), value: 'owner2'),
              ],
              onChanged: (value) {},
            ),
            Container(
              height: 150,
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 8),
              color: Colors.grey[300],
              child: Center(child: Text('Map Placeholder')),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Contact Number'),
              keyboardType: TextInputType.phone,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Store Status'),
                Switch(value: true, onChanged: (value) {}),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Upload Logo'),
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Assign Driver (Optional)'),
              items: [
                DropdownMenuItem(child: Text('Driver 1'), value: 'driver1'),
                DropdownMenuItem(child: Text('Driver 2'), value: 'driver2'),
              ],
              onChanged: (value) {},
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            // Save store logic here
          },
          child: Text('Save Store'),
        ),
      ],
    );
  }
}
