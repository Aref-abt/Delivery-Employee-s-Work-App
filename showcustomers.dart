import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'customerdetails.dart';
import 'finishedorder.dart';
import 'refusedorders.dart';

final List<String> _customers = [];
// domain of your server
const String _baseURL = 'mhgdctrvkj.000webhostapp.com';

class ShowCustomers extends StatefulWidget {
  const ShowCustomers({Key? key}) : super(key: key);

  @override
  State<ShowCustomers> createState() => _ShowCustomersState();
}

class _ShowCustomersState extends State<ShowCustomers> {
  bool _load = false;

  void update(bool success) {
    setState(() {
      _load = true; // show product list
      if (!success) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Failed to load data')));
      }
    });
  }

  @override
  void initState() {
    // update data when the widget is added to the tree the first time.
    updateCustomers(update);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Customers'),
        centerTitle: true,
        actions: [
          // Dropdown menu
          PopupMenuButton<String>(
            onSelected: (value) {
              // Navigate to the selected page
              if (value == 'finished_orders') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FinishedOrder()),
                );
              } else if (value == 'refused_orders') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RefusedOrders()),
                );
              }
              // Add more conditions for other pages
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'finished_orders',
                child: Text('Finished Orders'),
              ),
              PopupMenuItem<String>(
                value: 'refused_orders',
                child: Text('Refused Orders'),
              ),
              // Add more items for other pages
            ],
          ),
        ],
      ),
      body: _load
          ? const ListCustomers()
          : const Center(
              child: SizedBox(
                  width: 100, height: 100, child: CircularProgressIndicator())),
      backgroundColor: Color.fromARGB(255, 112, 111, 111),
    );
  }
}

class ListCustomers extends StatelessWidget {
  const ListCustomers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _customers.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 43, 223, 106),
                Color.fromARGB(255, 127, 246, 137)
              ],
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: ListTile(
            title: Text(
              'Customer: ${_customers[index]}',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomerDetails(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

void updateCustomers(Function(bool success) update) async {
  try {
    final url = Uri.http(_baseURL, '/getcustomers.php');
    final response = await http.get(url).timeout(const Duration(seconds: 5));

    print('Response Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    _customers.clear();

    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);

      for (var row in jsonResponse) {
        _customers.add(
          'Name: ${row['name']} | Phone: ${row['phone']} | Location: ${row['location']} | Order ID: ${row['orderID']} | Item Order: ${row['itemOrder']} | Total Price: ${row['totalPrice']}',
        );
      }

      update(true);
    } else {
      print('Failed to fetch data. Status Code: ${response.statusCode}');
      update(false);
    }
  } catch (e) {
    print('Error during data fetching: $e');
    update(false);
  }
}
