// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String EmailValueKey = 'email';
const String PasswordValueKey = 'password';
const String NameValueKey = 'name';
const String PhoneValueKey = 'phone';
const String AffilationValueKey = 'affilation';
const String SpecificationValueKey = 'specification';

final Map<String, TextEditingController> _SignupViewTextEditingControllers = {};

final Map<String, FocusNode> _SignupViewFocusNodes = {};

final Map<String, String? Function(String?)?> _SignupViewTextValidations = {
  EmailValueKey: null,
  PasswordValueKey: null,
  NameValueKey: null,
  PhoneValueKey: null,
  AffilationValueKey: null,
  SpecificationValueKey: null,
};

mixin $SignupView {
  TextEditingController get emailController =>
      _getFormTextEditingController(EmailValueKey);
  TextEditingController get passwordController =>
      _getFormTextEditingController(PasswordValueKey);
  TextEditingController get nameController =>
      _getFormTextEditingController(NameValueKey);
  TextEditingController get phoneController =>
      _getFormTextEditingController(PhoneValueKey);
  TextEditingController get affilationController =>
      _getFormTextEditingController(AffilationValueKey);
  TextEditingController get specificationController =>
      _getFormTextEditingController(SpecificationValueKey);

  FocusNode get emailFocusNode => _getFormFocusNode(EmailValueKey);
  FocusNode get passwordFocusNode => _getFormFocusNode(PasswordValueKey);
  FocusNode get nameFocusNode => _getFormFocusNode(NameValueKey);
  FocusNode get phoneFocusNode => _getFormFocusNode(PhoneValueKey);
  FocusNode get affilationFocusNode => _getFormFocusNode(AffilationValueKey);
  FocusNode get specificationFocusNode =>
      _getFormFocusNode(SpecificationValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_SignupViewTextEditingControllers.containsKey(key)) {
      return _SignupViewTextEditingControllers[key]!;
    }

    _SignupViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _SignupViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_SignupViewFocusNodes.containsKey(key)) {
      return _SignupViewFocusNodes[key]!;
    }
    _SignupViewFocusNodes[key] = FocusNode();
    return _SignupViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    emailController.addListener(() => _updateFormData(model));
    passwordController.addListener(() => _updateFormData(model));
    nameController.addListener(() => _updateFormData(model));
    phoneController.addListener(() => _updateFormData(model));
    affilationController.addListener(() => _updateFormData(model));
    specificationController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    emailController.addListener(() => _updateFormData(model));
    passwordController.addListener(() => _updateFormData(model));
    nameController.addListener(() => _updateFormData(model));
    phoneController.addListener(() => _updateFormData(model));
    affilationController.addListener(() => _updateFormData(model));
    specificationController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          EmailValueKey: emailController.text,
          PasswordValueKey: passwordController.text,
          NameValueKey: nameController.text,
          PhoneValueKey: phoneController.text,
          AffilationValueKey: affilationController.text,
          SpecificationValueKey: specificationController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _SignupViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _SignupViewFocusNodes.values) {
      focusNode.dispose();
    }

    _SignupViewTextEditingControllers.clear();
    _SignupViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get emailValue => this.formValueMap[EmailValueKey] as String?;
  String? get passwordValue => this.formValueMap[PasswordValueKey] as String?;
  String? get nameValue => this.formValueMap[NameValueKey] as String?;
  String? get phoneValue => this.formValueMap[PhoneValueKey] as String?;
  String? get affilationValue =>
      this.formValueMap[AffilationValueKey] as String?;
  String? get specificationValue =>
      this.formValueMap[SpecificationValueKey] as String?;

  set emailValue(String? value) {
    this.setData(
      this.formValueMap..addAll({EmailValueKey: value}),
    );

    if (_SignupViewTextEditingControllers.containsKey(EmailValueKey)) {
      _SignupViewTextEditingControllers[EmailValueKey]?.text = value ?? '';
    }
  }

  set passwordValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PasswordValueKey: value}),
    );

    if (_SignupViewTextEditingControllers.containsKey(PasswordValueKey)) {
      _SignupViewTextEditingControllers[PasswordValueKey]?.text = value ?? '';
    }
  }

  set nameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({NameValueKey: value}),
    );

    if (_SignupViewTextEditingControllers.containsKey(NameValueKey)) {
      _SignupViewTextEditingControllers[NameValueKey]?.text = value ?? '';
    }
  }

  set phoneValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PhoneValueKey: value}),
    );

    if (_SignupViewTextEditingControllers.containsKey(PhoneValueKey)) {
      _SignupViewTextEditingControllers[PhoneValueKey]?.text = value ?? '';
    }
  }

  set affilationValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AffilationValueKey: value}),
    );

    if (_SignupViewTextEditingControllers.containsKey(AffilationValueKey)) {
      _SignupViewTextEditingControllers[AffilationValueKey]?.text = value ?? '';
    }
  }

  set specificationValue(String? value) {
    this.setData(
      this.formValueMap..addAll({SpecificationValueKey: value}),
    );

    if (_SignupViewTextEditingControllers.containsKey(SpecificationValueKey)) {
      _SignupViewTextEditingControllers[SpecificationValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasEmail =>
      this.formValueMap.containsKey(EmailValueKey) &&
      (emailValue?.isNotEmpty ?? false);
  bool get hasPassword =>
      this.formValueMap.containsKey(PasswordValueKey) &&
      (passwordValue?.isNotEmpty ?? false);
  bool get hasName =>
      this.formValueMap.containsKey(NameValueKey) &&
      (nameValue?.isNotEmpty ?? false);
  bool get hasPhone =>
      this.formValueMap.containsKey(PhoneValueKey) &&
      (phoneValue?.isNotEmpty ?? false);
  bool get hasAffilation =>
      this.formValueMap.containsKey(AffilationValueKey) &&
      (affilationValue?.isNotEmpty ?? false);
  bool get hasSpecification =>
      this.formValueMap.containsKey(SpecificationValueKey) &&
      (specificationValue?.isNotEmpty ?? false);

  bool get hasEmailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey]?.isNotEmpty ?? false;
  bool get hasPasswordValidationMessage =>
      this.fieldsValidationMessages[PasswordValueKey]?.isNotEmpty ?? false;
  bool get hasNameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey]?.isNotEmpty ?? false;
  bool get hasPhoneValidationMessage =>
      this.fieldsValidationMessages[PhoneValueKey]?.isNotEmpty ?? false;
  bool get hasAffilationValidationMessage =>
      this.fieldsValidationMessages[AffilationValueKey]?.isNotEmpty ?? false;
  bool get hasSpecificationValidationMessage =>
      this.fieldsValidationMessages[SpecificationValueKey]?.isNotEmpty ?? false;

  String? get emailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey];
  String? get passwordValidationMessage =>
      this.fieldsValidationMessages[PasswordValueKey];
  String? get nameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey];
  String? get phoneValidationMessage =>
      this.fieldsValidationMessages[PhoneValueKey];
  String? get affilationValidationMessage =>
      this.fieldsValidationMessages[AffilationValueKey];
  String? get specificationValidationMessage =>
      this.fieldsValidationMessages[SpecificationValueKey];
}

extension Methods on FormStateHelper {
  setEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmailValueKey] = validationMessage;
  setPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PasswordValueKey] = validationMessage;
  setNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NameValueKey] = validationMessage;
  setPhoneValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PhoneValueKey] = validationMessage;
  setAffilationValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AffilationValueKey] = validationMessage;
  setSpecificationValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[SpecificationValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    emailValue = '';
    passwordValue = '';
    nameValue = '';
    phoneValue = '';
    affilationValue = '';
    specificationValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      EmailValueKey: getValidationMessage(EmailValueKey),
      PasswordValueKey: getValidationMessage(PasswordValueKey),
      NameValueKey: getValidationMessage(NameValueKey),
      PhoneValueKey: getValidationMessage(PhoneValueKey),
      AffilationValueKey: getValidationMessage(AffilationValueKey),
      SpecificationValueKey: getValidationMessage(SpecificationValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _SignupViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _SignupViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      EmailValueKey: getValidationMessage(EmailValueKey),
      PasswordValueKey: getValidationMessage(PasswordValueKey),
      NameValueKey: getValidationMessage(NameValueKey),
      PhoneValueKey: getValidationMessage(PhoneValueKey),
      AffilationValueKey: getValidationMessage(AffilationValueKey),
      SpecificationValueKey: getValidationMessage(SpecificationValueKey),
    });
