import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_app_app_bar_with_back.dart';
import '../widgets/reset_password_widgets/reset_password_view_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarWithBack(
        brightness: Brightness.dark,
        statusBarColor: AppColors.white,
        isScrolled: true,
      ),
      body: ResetPasswordViewBody(),
    );
  }
}
