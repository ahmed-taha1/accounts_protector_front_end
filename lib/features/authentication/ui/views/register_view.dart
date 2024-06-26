import 'package:accounts_protector/features/authentication/ui/widgets/Register_widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_app_bar_with_back.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: CustomAppBarWithBack(
        isScrolled: true,
        arrowColor: Theme.of(context).primaryColor,
        backGroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: const RegisterViewBody(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
