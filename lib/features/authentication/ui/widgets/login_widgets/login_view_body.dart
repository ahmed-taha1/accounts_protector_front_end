import 'package:accounts_protector/core/helper/spacing.dart';
import 'package:accounts_protector/core/networking/web_services/api_service.dart';
import 'package:accounts_protector/core/widgets/custom_input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../../../core/widgets/default_auth_text.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                children: [
                  verticalSpace(85),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: const DefaultAuthText(
                      mainText: 'Login',
                      subText: 'Please sign in to continue',
                      isLogoIncluded: true,
                    ),
                  ),
                  verticalSpace(33),
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
              onPressed: () async{
                await ApiService().login(email: emailController.text, password: passwordController.text);
                // context.go(Routes.platformsView.path);
              },
              text: 'LOGIN',
            ),
            verticalSpace(14),
            CustomTextButton(
              text: 'Forgot Password?',
              textStyle: TextStyles.font14SemiLightBlueBold,
              onPressed: () {
                context.push(Routes.forgotPasswordView.path);
              },
            ),
            verticalSpace(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyles.font15DarkGreySemiBold,
                ),
                CustomTextButton(
                  text: " Register",
                  textStyle: TextStyles.font14SemiLightBlueBold,
                  onPressed: () {
                    context.push(Routes.registerView.path);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
