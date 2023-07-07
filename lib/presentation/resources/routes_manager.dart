import '/presentation/forgot_password/forgot_password_view.dart';
import '/presentation/login/login_view.dart';
import '/presentation/main/main_view.dart';
import '/presentation/register/register_view.dart';
import '/presentation/resources/strings_manager.dart';
import '/presentation/splash/splash_view.dart';
import '/presentation/store_details/store_details_view.dart';
import 'package:flutter/material.dart';

import '../on_boarding/view/on_boarding_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String onBoarding = "/onBoarding";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default:
        return noRouteDefined();
    }
  }

  static Route<dynamic> noRouteDefined() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteDefined),
        ),
      ),
    );
  }
}
