import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pharm/app/app.locator.dart';
import 'package:pharm/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  String? _email;
  String? get email => _email;

  void setEmail({required String token}) {
    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(token);
    _email = jwtDecodedToken['email'];
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
