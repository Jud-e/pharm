import 'package:pharm/app/app.router.dart';
import 'package:pharm/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:pharm/app/app.locator.dart';

class LoginViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  int selectedOption = 2;
  bool isNotValidate = false;

  Future loginToHomepage() async {
    await HomeViewModel().sidebar();
    Future.delayed(const Duration(milliseconds: 300));
    if (selectedOption == 1) {
      _navigationService.navigateToDoctorHomeView();
    } else if (selectedOption == 2) {
      _navigationService.navigateToHomeView();
    }
    // _navigationService.navigateToHomeView();
  }

  Future redirectToSignup() async {
    _navigationService.navigateToSignupView();
  }

  @override
  void rebuildUi() {
    // TODO: implement rebuildUi
    super.rebuildUi();
  }
}
