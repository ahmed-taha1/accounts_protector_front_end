import 'package:accounts_protector/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/styles.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    Key? key,
    required this.icon,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    this.isPassword = false,
    this.suffixIcon,
    this.validationFunction,
    this.onChange,
  }) : super(key: key);

  final IconData icon;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final Widget? suffixIcon;
  final String? Function(String?)? validationFunction;
  final VoidCallback? onChange;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late FocusNode _focusNode;
  bool _isFocused = false;
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color:
                _isFocused ? Colors.black.withOpacity(0.1) : Colors.transparent,
            spreadRadius: 2,
            blurRadius: 7.4,
            offset: const Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(21.r),
      ),
      child: TextFormField(
        onChanged: (value) {
          widget.onChange?.call();
        },
        obscureText: widget.isPassword ? !_isPasswordVisible : false,
        controller: widget.controller,
        focusNode: _focusNode,
        keyboardType: widget.keyboardType,
        style: TextStyles.font17BlackPurpleBold,
        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.icon,
            color: _isFocused ? AppColors.blackPurple : AppColors.lightGrey,
          ),
          labelText: widget.hintText,
          labelStyle: TextStyles.font11LightGreyBold,
          floatingLabelStyle: TextStyles.font15DarkGreySemiBold,
          filled: true,
          fillColor: _isFocused ? AppColors.lightCyan : Colors.transparent,
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(21.r),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(21.r),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          errorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(21.r),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(21.r),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          contentPadding: EdgeInsets.only(
            top: 15.h,
            left: 10.w,
            right: 10.w,
            bottom: 20.h,
          ),
          errorStyle: TextStyles.font12RedBold,
          suffixIcon: widget.suffixIcon ??
              (widget.isPassword
                  ? GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            _isPasswordVisible = !_isPasswordVisible;
                          },
                        );
                      },
                      child: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: _isFocused
                            ? AppColors.blackPurple
                            : AppColors.lightGrey,
                      ),
                    )
                  : null),
        ),
        validator: widget.validationFunction,
      ),
    );
  }
}
