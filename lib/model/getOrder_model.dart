class Order {
  final int id;
  final String? userId;
  final String? orderNumber;
  final String? deliveryAddress;
  final String? totalAmount;
  final String? paymentMethod;
  final String? paymentStatus;
  final String? condition;
  final String? deliveryCharge;
  final String? createdAt;
  final String? updatedAt;

  Order({
    required this.id,
    this.userId,
    this.orderNumber,
    this.deliveryAddress,
    this.totalAmount,
    this.paymentMethod,
    this.paymentStatus,
    this.condition,
    this.deliveryCharge,
    this.createdAt,
    this.updatedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] ?? 0,
      userId: json['user_id'],
      orderNumber: json['order_number'],
      deliveryAddress: json['delivery_address'],
      totalAmount: json['total_amount'],
      paymentMethod: json['payment_method'],
      paymentStatus: json['payment_status'],
      condition: json['condition'],
      deliveryCharge: json['delivery_charge'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
