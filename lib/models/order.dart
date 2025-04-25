class Order {
  String orderId;
  DateTime dateTime;
  int quantity;
  String itemType;

  Order({
    required this.orderId,
    required this.dateTime,
    required this.quantity,
    required this.itemType,
  });

  void placeOrder() {}
}
