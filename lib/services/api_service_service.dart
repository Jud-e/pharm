class ApiServiceService {
  static const baseUrl = "http://192.168.100.99:3000/";
  static const doctor = "doctor/";
  static const patient = "patient/";
  static const doctorRegistration = "$baseUrl${doctor}register";
  static const patientRegistration = "$baseUrl${patient}register";
  static const patientLogin = "$baseUrl${patient}login";
  static const doctorLogin = "$baseUrl${doctor}login";
}
