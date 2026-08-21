import 'package:equatable/equatable.dart';

/// Order state enum - backend controlled
enum OrderState {
  searching,      // Looking for driver
  assigned,       // Driver assigned
  driverComing,   // Driver on the way to pickup
  arrived,        // Driver arrived at pickup
  pickedUp,       // Passenger/package picked up
  delivered,      // Delivery completed
  cancelled,      // Order cancelled
}

/// Service type enum
enum ServiceType {
  motoRide,       // Moto passenger transportation
  delivery,       // Package delivery
}

/// Order model
class Order extends Equatable {
  final String id;
  final String customerId;
  final String? driverId;
  final ServiceType serviceType;
  final OrderState state;
  final double pickupLatitude;
  final double pickupLongitude;
  final String pickupAddress;
  final double destinationLatitude;
  final double destinationLongitude;
  final String destinationAddress;
  final double estimatedDistance;
  final double estimatedPrice;
  final DateTime createdAt;
  final DateTime? completedAt;
  final bool helmetRequired;

  const Order({
    required this.id,
    required this.customerId,
    this.driverId,
    required this.serviceType,
    required this.state,
    required this.pickupLatitude,
    required this.pickupLongitude,
    required this.pickupAddress,
    required this.destinationLatitude,
    required this.destinationLongitude,
    required this.destinationAddress,
    required this.estimatedDistance,
    required this.estimatedPrice,
    required this.createdAt,
    this.completedAt,
    this.helmetRequired = false,
  });

  @override
  List<Object?> get props => [
        id,
        customerId,
        driverId,
        serviceType,
        state,
        pickupLatitude,
        pickupLongitude,
        pickupAddress,
        destinationLatitude,
        destinationLongitude,
        destinationAddress,
        estimatedDistance,
        estimatedPrice,
        createdAt,
        completedAt,
        helmetRequired,
      ];

  Order copyWith({
    String? id,
    String? customerId,
    String? driverId,
    ServiceType? serviceType,
    OrderState? state,
    double? pickupLatitude,
    double? pickupLongitude,
    String? pickupAddress,
    double? destinationLatitude,
    double? destinationLongitude,
    String? destinationAddress,
    double? estimatedDistance,
    double? estimatedPrice,
    DateTime? createdAt,
    DateTime? completedAt,
    bool? helmetRequired,
  }) {
    return Order(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      driverId: driverId ?? this.driverId,
      serviceType: serviceType ?? this.serviceType,
      state: state ?? this.state,
      pickupLatitude: pickupLatitude ?? this.pickupLatitude,
      pickupLongitude: pickupLongitude ?? this.pickupLongitude,
      pickupAddress: pickupAddress ?? this.pickupAddress,
      destinationLatitude: destinationLatitude ?? this.destinationLatitude,
      destinationLongitude: destinationLongitude ?? this.destinationLongitude,
      destinationAddress: destinationAddress ?? this.destinationAddress,
      estimatedDistance: estimatedDistance ?? this.estimatedDistance,
      estimatedPrice: estimatedPrice ?? this.estimatedPrice,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      helmetRequired: helmetRequired ?? this.helmetRequired,
    );
  }
}
