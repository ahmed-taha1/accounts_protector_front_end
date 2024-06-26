import 'package:accounts_protector/core/theming/text_styles.dart';
import 'package:accounts_protector/core/widgets/custom_button.dart';
import 'package:accounts_protector/core/widgets/custom_input_text_field.dart';
import 'package:accounts_protector/core/widgets/view_header.dart';
import 'package:accounts_protector/features/accounts/logic/accounts_cubit.dart';
import 'package:accounts_protector/features/accounts/ui/widgets/add_account_view/text_fields_grid.dart';
import 'package:accounts_protector/features/platforms/logic/platforms/platforms_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/spacing.dart';
import '../../../../../core/widgets/custom_loading.dart';

class AddAccountViewBody extends StatelessWidget {
  const AddAccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<AccountsCubit, AccountsState>(
        listener: (context, state) {
          if (state is CreateAccountSuccess) {
            EasyLoading.dismiss();
            final numOfAccounts =
                context.read<AccountsCubit>().selectedPlatform!.numOfAccounts;
            final platformId =
                context.read<AccountsCubit>().selectedPlatform!.platformId!;
            context
                .read<PlatformsCubit>()
                .changePlatformNumOfAccounts(platformId, numOfAccounts);
            context.pop();
          } else if (state is AccountLoadingState) {
            showCustomLoading();
          } else if (state is FailedState) {
            EasyLoading.dismiss();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage,
                ),
                backgroundColor: Colors.redAccent,
              ),
            );
          }
        },
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: const ViewHeader(
                  mainText: 'Create Account',
                  subText:
                      'please enter the account data that\nyou want to save',
                  iconPath: 'assets/svgs/account_icon.svg',
                  vSpace: 10,
                ),
              ),
              verticalSpace(40),
              CustomInputField(
                icon: Icons.person,
                hintText: 'AccountName',
                controller: context.read<AccountsCubit>().accountNameController,
                keyboardType: TextInputType.text,
              ),
              verticalSpace(20),
              const TextFieldsGrid(),
              verticalSpace(40),
              CustomButton(
                text: 'CREATE',
                onPressed: () {
                  context.read<AccountsCubit>().createAccount();
                },
              ),
              verticalSpace(40),
              Text('Field name ex:\n"Password", "Email", "User Name".',
                  style: TextStyles.font15DarkGreySemiBold.copyWith(
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                  textAlign: TextAlign.center),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}
