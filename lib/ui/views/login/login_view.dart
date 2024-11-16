import 'package:flutter/material.dart';
// import 'package:pharm/ui/common/text_form_field.dart';
import 'package:pharm/ui/common/ui_helpers.dart';
import 'package:pharm/ui/views/login/login_view.form.dart';
import 'package:stacked/stacked.dart';

import 'package:stacked/stacked_annotations.dart';

import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: "email"),
  FormTextField(name: "password"),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: LayoutBuilder(builder: ((context, BoxConstraints constraints) {
          if (constraints.maxWidth > 1000) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenWidth(context) * 0.7,
                  child: const Text("testing"),
                ),
                Container(
                  width: screenWidth(context) * 0.3,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          bottomLeft: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                              fontSize: getResponsiveMassiveFontSize(context)),
                        ),
                        custom(
                            "Enter your email address",
                            viewModel.isNotValidate == true
                                ? "Enter your email address"
                                : null,
                            emailController),
                        verticalSpaceSmall,
                        custom(
                            "Enter your password",
                            viewModel.isNotValidate == true
                                ? "Enter your password"
                                : null,
                            passwordController),
                        verticalSpaceMedium,
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Radio<int>(
                                      value: 1,
                                      groupValue: viewModel.selectedOption,
                                      onChanged: (value) {
                                        viewModel.selectedOption = value!;
                                        viewModel.rebuildUi();
                                      }),
                                  const Text("Doctor")
                                ],
                              ),
                              Row(
                                children: [
                                  Radio<int>(
                                      value: 2,
                                      groupValue: viewModel.selectedOption,
                                      onChanged: (value) {
                                        viewModel.selectedOption = value!;
                                        viewModel.rebuildUi();
                                      }),
                                  const Text("Patient")
                                ],
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              viewModel.roleLogin(
                                emailController.text,
                                passwordController.text,
                              );
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Signup"),
                            )),
                        verticalSpaceLarge,
                        InkWell(
                            child: const Text("Don't have an account? Sign up"),
                            onTap: () {
                              viewModel.redirectToSignup();
                            })
                      ],
                    )),
                  ),
                )
              ],
            );
          } else {
            return SingleChildScrollView(
              child: Container(
                height: screenHeight(context),
                decoration: const BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Login",
                          style: TextStyle(fontSize: 30),
                        ),
                        verticalSpaceSmall,
                        custom(
                            "Enter your email address",
                            viewModel.isNotValidate == true
                                ? "Enter your affilated hospital"
                                : null,
                            emailController),
                        verticalSpaceSmall,
                        custom(
                            "Enter your password",
                            viewModel.isNotValidate == true
                                ? "Enter your affilated hospital"
                                : null,
                            passwordController),
                        verticalSpaceSmall,
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Radio<int>(
                                      value: 1,
                                      groupValue: viewModel.selectedOption,
                                      onChanged: (value) {
                                        viewModel.selectedOption = value!;
                                        viewModel.rebuildUi();
                                      }),
                                  const Text("Doctor")
                                ],
                              ),
                              Row(
                                children: [
                                  Radio<int>(
                                      value: 2,
                                      groupValue: viewModel.selectedOption,
                                      onChanged: (value) {
                                        viewModel.selectedOption = value!;
                                        viewModel.rebuildUi();
                                      }),
                                  const Text("Patient")
                                ],
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              viewModel.roleLogin(
                                emailController.text,
                                passwordController.text,
                              );
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Login"),
                            )),
                        verticalSpaceLarge,
                        InkWell(
                            child: const Text("Don't have an account? Sign up"),
                            onTap: () {
                              viewModel.redirectToSignup();
                            })
                      ]),
                ),
              ),
            );
          }
        })));
  }

  TextFormField custom(
      String label, String? errorText, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: label,
          filled: true,
          fillColor: Colors.white,
          errorText: errorText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.black87, width: 1)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black87, width: 1.5))),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    // TODO: implement onViewModelReady
    viewModel.initSharedPref();
    super.onViewModelReady(viewModel);
  }
}
