import 'package:accounts_protector/core/helper/spacing.dart';
import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:accounts_protector/core/widgets/custom_button.dart';
import 'package:accounts_protector/core/widgets/custom_input_text_field.dart';
import 'package:accounts_protector/core/widgets/default_add_platform_text.dart';
import 'package:accounts_protector/features/platforms/logic/platforms/platforms_cubit.dart';
import 'package:accounts_protector/features/platforms/ui/widgets/add_platform_view_widgets/platform_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddPlatformViewBody extends StatelessWidget {
  const AddPlatformViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController platformNameInputController = TextEditingController();
    return BlocConsumer<PlatformsCubit, PlatformsState>(
      listener: (context, state) {
        if (state is PlatformCreateSuccess) {
          context.pop();
        } else if (state is PlatformCreateFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: AppColors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 42.w),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const DefaultAddPlatformText(
                      mainText: "Add Platform",
                      subText: "Please fill the input below here",
                      iconPath: "assets/svgs/platforms.svg",
                    ),
                    verticalSpace(33),
                    CustomInputField(
                      controller: platformNameInputController,
                      hintText: 'Platform Name',
                      icon: Icons.person,
                      keyboardType: TextInputType.text,
                    ),
                    verticalSpace(33),
                    const PlatformColorPicker(),
                    verticalSpace(33),
                    CustomButton(
                      text: "Create",
                      onPressed: () {
                        context.read<PlatformsCubit>().createPlatform(
                          platformNameInputController.text,
                          context
                              .read<PlatformsCubit>()
                              .selectedColor
                              .value
                              .toRadixString(16),
                        );
                      },
                      isLoading: context
                          .watch<PlatformsCubit>()
                          .isLoading,
                    ),
                    verticalSpace(40),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
