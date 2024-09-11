import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'finishedorder.dart';
import 'refusedorders.dart';

class CustomerDetails extends StatelessWidget {
  const CustomerDetails({Key? key}) : super(key: key);

  // Navigate to the Finished Order page
  void navigateToFinishedOrder(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FinishedOrder()),
    );
  }

  // Navigate to the Refused Orders page
  void navigateToRefusedOrders(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RefusedOrders()),
    );
  }

  // Initiate a phone call
  void callCustomer(String phoneNumber) async {
    final phoneUrl = 'tel:$phoneNumber';
    if (await canLaunch(phoneUrl)) {
      await launch(phoneUrl);
    } else {
      // Handle error, e.g., show an alert
      print('Error launching phone call');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jhon Waterson',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text('Location: Customer Location'),
                SizedBox(width: 20),
                Text('ID: 12345'),
              ],
            ),
            Text('Phone Number: +1234567890'),
            Text('Order ID: 12345'),
            Text('Item Order: Some Items'),
            Text('Total Price: \$50.00'),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                navigateToFinishedOrder(context);
              },
              icon: Icon(Icons.attach_money),
              label: Text('Collect Payment'),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                navigateToRefusedOrders(context);
              },
              icon: Icon(Icons.cancel),
              label: Text('Order Refused'),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                callCustomer("79313671");
              },
              icon: Icon(Icons.phone),
              label: Text('Call Customer'),
            ),
          ],
        ),
      ),
    );
  }
}
