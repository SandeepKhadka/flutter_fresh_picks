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
  final List<Product> products;

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
    required this.products,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    List<Product> products = [];
    if (json['products'] != null) {
      products = List<Product>.from(
          json['products'].map((product) => Product.fromJson(product)));
    }

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
      products: products,
    );
  }
}

class Product {
  final int id;
  final String name;
  final String quantity;
  final String? createdAt;
  final String? updatedAt;

  Product({
    required this.id,
    required this.name,
    required this.quantity,
    this.createdAt,
    this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      name: json['name'],
      quantity: json['pivot']['quantity'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
