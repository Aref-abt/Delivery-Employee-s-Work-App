//define Customer attrs
class Customer {
  final String name;
  final String phoneNumber;
  final String location;
  final int orderId;
  final String itemOrder;
  final double totalPrice;

  Customer({
    required this.name,
    required this.phoneNumber,
    required this.location,
    required this.orderId,
    required this.itemOrder,
    required this.totalPrice,
  });

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      name: map['name'],
      phoneNumber: map['phone'],
      location: map['location'],
      orderId: map['orderID'],
      itemOrder: map['itemOrder'],
      totalPrice: map['totalPrice'].toDouble(),
    );
  }
}
