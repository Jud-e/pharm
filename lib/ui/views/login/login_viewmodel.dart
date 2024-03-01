import 'dart:convert';
import 'package:pharm/app/app.router.dart';
import 'package:pharm/services/api_service_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:pharm/app/app.locator.dart';
import 'package:http/http.dart' as http;

class LoginViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  int selectedOption = 2;
  bool isNotValidate = false;
  late SharedPreferences prefs;

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future roleLogin(String email, String password) async {
    if (selectedOption == 1) {
      doctorLogin(email, password);
    } else if (selectedOption == 2) {
      patientLogin(email, password);
    }
  }

  Future patientLogin(
    String email,
    String password,
  ) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      var regBody = {"email": email, "password": password};
      try {
        var response = await http.post(
          Uri.parse(ApiServiceService.patientLogin),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody),
        );

        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse["status"] == true) {
          var myToken = jsonResponse["token"];
          prefs.setString("token", myToken);
          _navigationService.navigateToHomeView(token: myToken);
        } else {}
      } on Exception catch (e) {
        throw (e);
      }
    } else {
      isNotValidate = true;
      rebuildUi();
    }
  }

  Future doctorLogin(String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      var regBody = {"email": email, "password": password};
      try {
        var response = await http.post(
          Uri.parse(ApiServiceService.doctorLogin),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody),
        );
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse["status"] == true) {
          var myToken = jsonResponse["token"];
          prefs.setString("token", myToken);
          _navigationService.navigateToDoctorHomeView(token: myToken);
        }
      } on Exception catch (e) {
        throw (e);
      }
    } else {
      isNotValidate = true;
      rebuildUi();
    }
  }

  Future redirectToSignup() async {
    _navigationService.navigateToSignupView();
  }

  @override
  void rebuildUi() {
    super.rebuildUi();
  }
}
