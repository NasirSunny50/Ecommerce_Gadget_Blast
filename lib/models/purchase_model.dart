import 'package:cloud_firestore/cloud_firestore.dart';

class PurchaseModel{
  String? purchaseId;
  String? productId;
  Timestamp? purchaseTimestamp;
  int year;
  int month;
  int day;
  num purchasePrice;
  num purchaseQuantity;

  PurchaseModel(
      {this.purchaseId,
      this.productId,
      this.purchaseTimestamp,
      required this.year,
      required this.month,
      required this.day,
      this.purchasePrice = 0.0,
      this.purchaseQuantity = 1});

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      'purchaseId': purchaseId,
      'productId': productId,
      'Timestamp': purchaseTimestamp,
      'purchasePrice': purchasePrice,
      'quantity': purchaseQuantity,
      'year': year,
      'month': month,
      'day': day,
    };
    return map;
  }

  factory PurchaseModel.fromMap(Map<String, dynamic> map) => PurchaseModel(
    purchaseId: map['purchaseId'],
    productId: map['productId'],
    purchaseTimestamp: map['Timestamp'],
    purchasePrice: map['purchasePrice'],
    purchaseQuantity: map['quantity'],
    year: map['year'],
    month: map['month'],
    day: map['day'],
  );

}