import 'dart:convert';

import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pharm/app/app.locator.dart';
import 'package:pharm/app/app.router.dart';
import 'package:pharm/models/doctor_model.dart';
import 'package:pharm/services/api_service_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:http/http.dart' as http;

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  String? _email;
  String? get email => _email;

  final List<DoctorModel> _doctors = [];
  List<DoctorModel> get doctors => _doctors;

  void setEmail({required String token}) {
    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(token);
    _email = jwtDecodedToken['email'];
  }

  Future searchDoctor(String name) async {
    try {
      _doctors.clear();
      var response = await http.get(
        Uri.parse(ApiServiceService.searchDoctor + name),
        headers: {"Content-Type": "application/json"},
      );
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse["status"] == true) {
        // final doctorModel = DoctorModel.fromJson(jsonResponse["data"][0]);
        // print(doctorModel.runtimeType);
        for (var doctor in jsonResponse["data"]) {
          _doctors.add(DoctorModel.fromJson(doctor));
          print(_doctors[0]);
        }
        rebuildUi();
        int length = doctors.length;
        return length;
      }
    } catch (e) {
      print(e);
    }
  }

  SideMenuController sideMenu = SideMenuController();
  PageController pageController = PageController();
  Future sidebar() async {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
  }

  Future logout() async {
    _navigationService.navigateToLoginView();
    sideMenu.dispose();
    pageController.dispose();
  }
}
