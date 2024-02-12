// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RoomModel {
  int id;
  String type;
  String status;
  String customerName;
  RoomModel({
    required this.id,
    required this.type,
    required this.status,
    required this.customerName,
  });

  RoomModel copyWith({
    int? id,
    String? type,
    String? status,
    String? customerName,
  }) {
    return RoomModel(
      id: id ?? this.id,
      type: type ?? this.type,
      status: status ?? this.status,
      customerName: customerName ?? this.customerName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'status': status,
      'customerName': customerName,
    };
  }

  factory RoomModel.fromMap(Map<String, dynamic> map) {
    return RoomModel(
      id: map['id'] as int,
      type: map['type'] as String,
      status: map['status'] as String,
      customerName: map['customerName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RoomModel.fromJson(String source) =>
      RoomModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RoomModel(id: $id, type: $type, status: $status, customerName: $customerName)';
  }

  @override
  bool operator ==(covariant RoomModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.type == type &&
      other.status == status &&
      other.customerName == customerName;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      type.hashCode ^
      status.hashCode ^
      customerName.hashCode;
  }
}
