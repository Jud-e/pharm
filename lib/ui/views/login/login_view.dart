import 'package:flutter/material.dart';
import 'package:pharm/ui/common/text_form_field.dart';
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
                Container(
                  width: screenWidth(context) * 0.7,
                  child: Text("testing"),
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
                        CustomTextField(
                            errorText: viewModel.isNotValidate == true
                                ? "Enter your email address"
                                : null,
                            label: "Enter your email address",
                            controller: emailController),
                        verticalSpaceSmall,
                        CustomTextField(
                            errorText: viewModel.isNotValidate == true
                                ? "Enter your email address"
                                : null,
                            label: "Enter a password",
                            controller: passwordController),
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
                              viewModel.loginToHomepage();
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
            return Container(
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
                      CustomTextField(
                          errorText: viewModel.isNotValidate == true
                              ? "Enter your email address"
                              : null,
                          label: "Enter your email address",
                          controller: emailController),
                      verticalSpaceSmall,
                      CustomTextField(
                          errorText: viewModel.isNotValidate == true
                              ? "Enter your email address"
                              : null,
                          label: "Enter a password",
                          controller: passwordController),
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
                            viewModel.loginToHomepage();
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
                    ]),
              ),
            );
          }
        })));
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();

  @override
  void onViewModelReady(LoginViewModel viewModel) async {
    // TODO: implement onViewModelReady
  }
}
