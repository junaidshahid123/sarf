import 'package:flutter/material.dart';

import 'package:sarf/src/Auth/LoginScreen.dart';
import 'package:sarf/src/Auth/change_password.dart';
import 'package:sarf/src/baseview/home/home_view.dart';
import 'package:sarf/src/baseview/members/cites_list_view.dart';
import 'package:sarf/src/baseview/members/members_list_view.dart';
import 'package:sarf/src/utils/routes_name.dart';
import '../Auth/otp.dart';
import '../Auth/registration_details.dart';
import '../baseview/base_view.dart';
import '../baseview/more/support.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.base:
        return MaterialPageRoute(
            builder: (BuildContext context) => const BaseView());
      case RoutesName.LogIn:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      case RoutesName.ChangePassword:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ChangePassword());
      case RoutesName.homeView:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RoutesName.OtpScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OtpScreen());
      case RoutesName.RegistrationDetails:
        return MaterialPageRoute(
            builder: (BuildContext context) => const RegistrationDetails());
      case RoutesName.cityList:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CityListScreen());
      case RoutesName.membersList:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MembersListScreen());
      case RoutesName.Support:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                const Support()); // case RoutesName.Splash:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const SplashScreen());
      // case RoutesName.Boarding:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const BoardingScreen());
      // case RoutesName.SignIn:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const Signin());
      // case RoutesName.PhoneVerificaion:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const PhoneVerification());
      // case RoutesName.TestingScreen:
      // return MaterialPageRoute(builder: (BuildContext context)=>  TestingScreen());
      // case RoutesName.Verb:
      //   return MaterialPageRoute(builder: (BuildContext context)=> const VerbsScreen());
      // case RoutesName.Worship:
      //   return MaterialPageRoute(builder: (BuildContext context)=> const WorshipScreen());
      // case RoutesName.Bodily:
      //   return MaterialPageRoute(builder: (BuildContext context)=> const BodilyScreen());
      // case RoutesName.Name:
      //   return MaterialPageRoute(builder: (BuildContext context)=> const NameScreen());
      // case RoutesName.Place:
      //   return MaterialPageRoute(builder: (BuildContext context)=> const PlaceScreen());
      // case RoutesName.Faith:
      //   return MaterialPageRoute(builder: (BuildContext context)=> const FaithScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No Route Defined'),
            ),
          );
        });
    }
  }
}
