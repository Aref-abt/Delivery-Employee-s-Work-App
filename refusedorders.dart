import 'package:flutter/material.dart';
import 'orderdetails.dart';

class RefusedOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Manually added order details
    OrderDetails orderDetails = OrderDetails(
      customerName: 'Jane Doe',
      location: '456 Park Ave, City',
      orderId: 'XYZ789',
      phoneNumber: '+9876543210',
      itemOrder: 'Pasta, Salad',
      totalPrice: '\$25.00',
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Refused Orders'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cancel,
              color: Colors.red,
              size: 100,
            ),
            Text(
              'Order Refused',
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
