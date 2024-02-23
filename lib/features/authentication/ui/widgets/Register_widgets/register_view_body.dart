import 'package:accounts_protector/core/routing/app_router.dart';
import 'package:accounts_protector/core/widgets/default_auth_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_input_text_field.dart';
import '../../../../../core/widgets/custom_text_button.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController rePasswordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // scrolledUnderElevation: 5,
        toolbarHeight: 33.h,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: const DefaultAuthText(
                  mainText: 'Create Account',
                  subText: 'Please fill the input below here',
                ),
              ),
              verticalSpace(54),
              CustomInputField(
                icon: Icons.person,
                hintText: 'FIRST NAME',
                controller: firstNameController,
                keyboardType: TextInputType.text,
              ),
              verticalSpace(11),
              CustomInputField(
                icon: Icons.person,
                hintText: 'LAST NAME',
                controller: lastNameController,
                keyboardType: TextInputType.text,
              ),
              verticalSpace(11),
              CustomInputField(
                icon: Icons.email_outlined,
                hintText: 'EMAIL',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              verticalSpace(11),
              CustomInputField(
                icon: Icons.phone,
                hintText: 'PHONE',
                controller: phoneController,
                keyboardType: TextInputType.phone,
              ),
              verticalSpace(11),
              CustomInputField(
                icon: Icons.lock_outline,
                hintText: 'PASSWORD',
                controller: passwordController,
                keyboardType: TextInputType.text,
                isPassword: true,
              ),
              verticalSpace(11),
              CustomInputField(
                icon: Icons.lock_outline,
                hintText: 'CONFIRM PASSWORD',
                controller: rePasswordController,
                keyboardType: TextInputType.text,
                isPassword: true,
              ),
              verticalSpace(18),
              CustomButton(
                onPressed: () {
                  context.go(AppRouter.kLoginView);
                },
                text: 'REGISTER',
              ),
              verticalSpace(29),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyles.font15DarkGreySemiBold,
                  ),
                  CustomTextButton(
                    text: " Login",
                    textStyle: TextStyles.font14SemiLightBlueBold,
                    onPressed: () {
                      context.go(AppRouter.kLoginView);
                    },
                  ),
                ],
              ),
              verticalSpace(15),
            ],
          ),
        ),
      ),
    );
  }
}