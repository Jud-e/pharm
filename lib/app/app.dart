import 'package:pharm/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:pharm/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:pharm/ui/views/home/home_view.dart';
import 'package:pharm/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:pharm/services/api_service_service.dart';
import 'package:pharm/ui/views/signup/signup_view.dart';
import 'package:pharm/services/authentication_service.dart';
import 'package:pharm/ui/views/login/login_view.dart';
import 'package:pharm/ui/views/doctor_home/doctor_home_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: DoctorHomeView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiServiceService),
    LazySingleton(classType: AuthenticationService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
