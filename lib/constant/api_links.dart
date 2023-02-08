// ignore_for_file: constant_identifier_names

class ApiLinks {
  // assets base path
  //static const String assetBasePath = "https://soaqna.said.com.sa/public/";

  // api path and links
  static const String base = 'https://sarfapp.com/api';
  static const String registerUser = '$base/register';
  static const String loginUser = '$base/login';
  static const String register = '$base/register';
  static const String verify_otp = '$base/verify_otp';
  static const String reset_password = '$base/reset_password';
  static const String about = '$base/page';
  static const String delete_account = '$base/delete_account';
  static const String profile = '$base/profile';
  static const String change_profile = '$base/user/update';
  static const String change_password = '$base/change_password';
  static const String membersList = '$base/member_list?language=';
  static const String cityList = '$base/cities_members';
  static const String getHome = '$base/user';
  static const String addBudget = '$base/budget/add';
  static const String data_collection = '$base/data_collection?language=';
  static const String registration = '$base/user/registration';
  static const String getSupportTypes = '$base/app_support/type?language=';
  static const String forgotPassword = '$base/forget_password';
  static const String addSupport = '$base/app_support/add';
  static const String getSupport = '$base/app_support';
  static const String getSupportDetails = '$base/app_support/detail';
  static const String assetBasePath =
      'https://sarfapp.com/public/';
  static const String supportReply = '$base/app_support/reply';
  static const String budgetDelete = '$base/budget/destroy';
  static const String resetBudget = '$base/budget/reset';
  static const String logout = '$base/logout';
  static const String alerts = '$base/alerts';
  static const String alertsClear = '$base/alerts/clear';
  static const String simpleInvoice = '$base/generate_simple_invoice';
  static const String memberNewList = '$base/members';
  static const String memberDetails = '$base/members_detail';
  static const String invoiceDetails = '$base/invoice_detail';
  static const String invoiceAttach = '$base/send_attachment_to_invoice';
  static const String invoiceList = '$base/invoices?language=';
  static const String mobileCheckInvoice = '$base/mobile_check';
  static const String firebaseFileStorage = '$base/firebase_file_upload';
  static const String getAccounts = '$base/group_accounts';
}
