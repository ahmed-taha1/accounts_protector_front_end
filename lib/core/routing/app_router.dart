import 'package:accounts_protector/core/services/cache_service.dart';
import 'package:accounts_protector/core/routing/routes.dart';
import 'package:accounts_protector/features/accounts/ui/views/account_view.dart';
import 'package:accounts_protector/features/accounts/ui/views/accounts_view.dart';
import 'package:accounts_protector/features/authentication/ui/views/login_view.dart';
import 'package:accounts_protector/features/authentication/ui/views/otp_validation_view.dart';
import 'package:accounts_protector/features/authentication/ui/views/register_view.dart';
import 'package:accounts_protector/features/authentication/ui/views/reset_password_view.dart';
import 'package:accounts_protector/features/help/help_view.dart';
import 'package:accounts_protector/features/pin/ui/views/pin_view.dart';
import 'package:accounts_protector/features/platforms/ui/views/add_platform_view.dart';
import 'package:accounts_protector/features/platforms/ui/views/edit_platform_view.dart';
import 'package:accounts_protector/features/platforms/ui/views/platforms_view.dart';
import 'package:accounts_protector/features/settings/ui/views/settings_view.dart';
import 'package:accounts_protector/features/splash_screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/accounts/ui/views/add_account_view.dart';
import '../../features/accounts/ui/views/edit_account_view.dart';
import '../../features/authentication/ui/views/forgot_password_view.dart';
import '../../features/pin/ui/views/create_pin_view.dart';
import '../../features/platforms/logic/platforms/platforms_cubit.dart';

abstract class AppRouter {
  static String? currentLocation;
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
          path: Routes.loginView.path,
          builder: (context, state) => const LoginView()),
      GoRoute(
        path: Routes.forgotPasswordView.path,
        builder: (context, state) => const ForgotPasswordView(),
      ),
      GoRoute(
        path: Routes.registerView.path,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
          path: Routes.otpValidationView.path,
          builder: (context, state) => const OtpValidationView()),
      GoRoute(
          path: Routes.resetPasswordView.path,
          builder: (context, state) => const ResetPasswordView()),
      GoRoute(
          path: Routes.platformsView.path,
          builder: (context, state) => const PlatformsView()),
      GoRoute(
          path: Routes.addPlatformView.path,
          builder: (context, state) => const AddPlatformView()),
      GoRoute(
          path: Routes.createPinView.path,
          builder: (context, state) => const CreatePinView()),
      GoRoute(
          path: Routes.pinView.path,
          builder: (context, state) {
            return PinView(onSuccessCallback: state.extra as VoidCallback);
          }),
      GoRoute(
          path: Routes.splashView.path,
          builder: (context, state) => const SplashScreen()),
      GoRoute(
          path: Routes.settingsView.path,
          builder: (context, state) => const SettingsView()),
      GoRoute(
          path: Routes.accountsView.path,
          builder: (context, state) => const AccountsView()),
      GoRoute(
          path: Routes.addAccountView.path,
          builder: (context, state) => const AddAccountView()),
      GoRoute(
          path: Routes.accountView.path,
          builder: (context, state) => const AccountView()),
      GoRoute(
          path: Routes.editAccountView.path,
          builder: (context, state) => const EditAccountView()),
      GoRoute(
          path: Routes.editPlatformView.path,
          builder: (context, state) => const EditPlatformView()),
      GoRoute(
          path: Routes.splashView.path,
          builder: (context, state) => const SplashScreen()),
      GoRoute(
          path: Routes.helpView.path,
          builder: (context, state) => const HelpView()),
    ],
    initialLocation: Routes.loginView.path,
  );

  static void setInitialRoute() {
    if (CacheHelper.getData(key: CacheHelperConstants.isLogged) == true) {
      router.go(
        Routes.pinView.path,
        extra: () {
          router.go(Routes.platformsView.path);
        },
      );
    }
  }
}