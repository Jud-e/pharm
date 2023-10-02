import 'package:flutter/material.dart';
import 'package:pharm/ui/common/text_form_field.dart';
import 'package:pharm/ui/common/ui_helpers.dart';
import 'package:pharm/ui/views/signup/signup_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'signup_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: "email"),
  FormTextField(name: "password"),
  FormTextField(name: "name"),
  FormTextField(name: "phone"),
  FormTextField(name: "affilation"),
  FormTextField(name: "specification"),
])
class SignupView extends StackedView<SignupViewModel> with $SignupView {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: LayoutBuilder(
        builder: ((context, BoxConstraints constraints) {
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
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(100))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Signup",
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
                        verticalSpaceSmall,
                        custom(
                            "Enter your name",
                            viewModel.isNotValidate == true
                                ? "Enter your name"
                                : null,
                            nameController),
                        verticalSpaceSmall,
                        custom(
                            "Enter your phone number",
                            viewModel.isNotValidate == true
                                ? "Enter your phone number"
                                : null,
                            phoneController),
                        verticalSpaceMedium,
                        Visibility(
                            visible:
                                viewModel.selectedOption == 1 ? true : false,
                            child: Column(
                              children: [
                                custom(
                                    "Enter your specification",
                                    viewModel.isNotValidate == true
                                        ? "Enter your specification"
                                        : null,
                                    specificationController),
                                verticalSpaceSmall,
                                custom(
                                    "Enter your affilated hospital",
                                    viewModel.isNotValidate == true
                                        ? "Enter your affilated hospital"
                                        : null,
                                    affilationController),
                              ],
                            )),
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
                              viewModel.roleSignIn(
                                  emailController.text,
                                  passwordController.text,
                                  nameController.text,
                                  phoneController.text,
                                  affilationController.text,
                                  specificationController.text);
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Signup"),
                            )),
                        Row(
                          children: [
                            Container(
                                // child: RadioListTile(
                                //   value: 1,
                                //   title: Text("Patient"),
                                //   groupValue: 1,
                                //   onChanged: (){},
                                // ),
                                ),
                            Container()
                          ],
                        ),
                        verticalSpaceLarge,
                        InkWell(
                            child: const Text("Already have an account? Login"),
                            onTap: () {
                              viewModel.redirectToLogin();
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
                decoration: const BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Signup",
                        style: TextStyle(fontSize: 30),
                      ),
                      verticalSpaceSmall,
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
                      verticalSpaceSmall,
                      custom(
                          "Enter your name",
                          viewModel.isNotValidate == true
                              ? "Enter your name"
                              : null,
                          nameController),
                      verticalSpaceSmall,
                      custom(
                          "Enter your phonenumber",
                          viewModel.isNotValidate == true
                              ? "Enter your phone number"
                              : null,
                          phoneController),
                      verticalSpaceMedium,
                      Visibility(
                          visible: viewModel.selectedOption == 1 ? true : false,
                          child: Column(
                            children: [
                              custom(
                                  "Enter your specification",
                                  viewModel.isNotValidate == true
                                      ? "Enter your specification"
                                      : null,
                                  specificationController),
                              verticalSpaceSmall,
                              custom(
                                  "Enter your affilated hospital",
                                  viewModel.isNotValidate == true
                                      ? "Enter your affilated hospital"
                                      : null,
                                  affilationController),
                            ],
                          )),
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
                            viewModel.roleSignIn(
                                emailController.text,
                                passwordController.text,
                                nameController.text,
                                phoneController.text,
                                specificationController.text,
                                affilationController.text);
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Signup"),
                          )),
                      Row(
                        children: [
                          Container(
                              // child: RadioListTile(
                              //   value: 1,
                              //   title: Text("Patient"),
                              //   groupValue: 1,
                              //   onChanged: (){},
                              // ),
                              ),
                          Container()
                        ],
                      ),
                      verticalSpaceLarge,
                      InkWell(
                          child: const Text("Already have an account? Login"),
                          onTap: () {
                            viewModel.redirectToLogin();
                          })
                    ],
                  ),
                ),
              ),
            );
          }
        }),
      ),
    );
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
  SignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupViewModel();
}
