import 'package:accounts_protector/core/helper/spacing.dart';
import 'package:accounts_protector/core/widgets/custom_input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import 'logo_with_login_text.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: Column(
            children: [
              const LogoWithLoginText(),
              verticalSpace(33),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Column(
                  children: [
                    CustomInputField(
                      controller: emailController,
                      hintText: 'EMAIL',
                      icon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    verticalSpace(12),
                    CustomInputField(
                      controller: passwordController,
                      hintText: 'PASSWORD',
                      icon: Icons.lock,
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                    ),
                  ],
                ),
              ),
              verticalSpace(18),
              CustomButton(
                onPressed: () {},
                text: 'LOGIN',
              ),
              verticalSpace(14),
              CustomTextButton(
                text: 'Forgot Password?',
                textStyle: TextStyles.font14SemiLightGreenBold,
                onPressed: () {},
              ),
              verticalSpace(106),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyles.font15DarkGreySemiBold,
                  ),
                  CustomTextButton(
                    text: " Register",
                    textStyle: TextStyles.font14SemiLightGreenBold,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
