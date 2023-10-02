import 'dart:convert';

// import 'package:flutter/material.dart';
import 'package:pharm/app/app.locator.dart';
import 'package:pharm/app/app.router.dart';
import 'package:pharm/services/api_service_service.dart';
// import 'package:pharm/ui/views/signup/signup_view.dart';
// import 'package:pharm/ui/common/text_form_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:http/http.dart' as http;

class SignupViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  bool isNotValidate = false;
  int selectedOption = 2;

  Future roleSignIn(String email, String password, String name, String phoneNum,
      String? affilation, String? specification) async {
    if (selectedOption == 1) {
      registerDoctor(
          email, password, name, phoneNum, affilation!, specification!);
    } else if (selectedOption == 2) {
      registerPatient(email, password, name, phoneNum);
    }
  }

  Future redirectToLogin() async {
    _navigationService.navigateToLoginView();
  }

  Future registerPatient(
      String email, String password, String name, String phoneNum) async {
    if (email.isNotEmpty &&
        password.isNotEmpty &&
        name.isNotEmpty &&
        phoneNum.isNotEmpty) {
      var regBody = {
        "email": email,
        "password": password,
        "name": name,
        "phone": phoneNum
      };
      try {
        var response = await http.post(
          Uri.parse(ApiServiceService.patientRegistration),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody),
        );
        // print(response.body);
      } on Exception catch (e) {
        // TODO
        throw (e);
      }
    } else {
      // print("hello");
      isNotValidate = true;
      rebuildUi();
    }
  }

  Future registerDoctor(String email, String password, String name,
      String phoneNum, String specification, String affilation) async {
    if (email.isNotEmpty &&
        password.isNotEmpty &&
        name.isNotEmpty &&
        phoneNum.isNotEmpty &&
        specification.isNotEmpty &&
        affilation.isNotEmpty) {
      var regBody = {
        "email": email,
        "password": password,
        "name": name,
        "phone": phoneNum,
        "specification": specification,
        "affilation": affilation,
      };
      try {
        var response = await http.post(
          Uri.parse(ApiServiceService.doctorRegistration),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody),
        );
        print(response.body);
        // print(response.body);
      } on Exception catch (e) {
        // TODO
        print(e);
      }
    } else {
      // print("hello");
      isNotValidate = true;
      rebuildUi();
    }
  }
}
