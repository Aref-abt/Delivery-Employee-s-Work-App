import 'package:flutter/material.dart';

import 'orderdetails.dart';

class FinishedOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Manually added order details
    OrderDetails orderDetails = OrderDetails(
      customerName: 'John Doe',
      location: '123 Main St, City',
      orderId: 'ABC123',
      phoneNumber: '+1234567890',
      itemOrder: 'Pizza, Burger',
      totalPrice: '\$30.00',
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Finished Order'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ),
            Text(
              'Payment Collected',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Display customer info here
            Text('Customer Name: ${orderDetails.customerName}'),
            Text('Location: ${orderDetails.location}'),
            Text('Phone Number: ${orderDetails.phoneNumber}'),
            Text('Order ID: ${orderDetails.orderId}'),
            Text('Item Order: ${orderDetails.itemOrder}'),
            Text('Total Price: ${orderDetails.totalPrice}'),
          ],
        ),
      ),
    );
  }
}
