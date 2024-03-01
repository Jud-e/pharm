// To parse this JSON data, do
//
//     final doctorModel = doctorModelFromJson(jsonString);

import 'dart:convert';

DoctorModel doctorModelFromJson(String str) =>
    DoctorModel.fromJson(json.decode(str));

String doctorModelToJson(DoctorModel data) => json.encode(data.toJson());

class DoctorModel {
  dynamic address;
  String id;
  String email;
  String name;
  String password;
  dynamic phoneNumber;
  String specification;
  dynamic affilation;
  List<dynamic> appointment;

  DoctorModel({
    required this.address,
    required this.id,
    required this.email,
    required this.name,
    required this.password,
    required this.phoneNumber,
    required this.specification,
    required this.affilation,
    required this.appointment,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        address: json["address"],
        id: json["id"],
        email: json["email"],
        name: json["name"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
        specification: json["specification"],
        affilation: json["affilation"],
        appointment: List<dynamic>.from(json["appointment"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "id": id,
        "email": email,
        "name": name,
        "password": password,
        "phoneNumber": phoneNumber,
        "specification": specification,
        "affilation": affilation,
        "appointment": List<dynamic>.from(appointment.map((x) => x)),
      };
}
