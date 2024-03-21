import 'package:accounts_protector/core/helper/font_weight_helper.dart';
import 'package:accounts_protector/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/theming/styles.dart';

class PlatformsGridItem extends StatelessWidget {
  PlatformsGridItem({
    super.key,
    required this.cardClick,
    required this.platformName,
    required this.numOfAccounts,
    required this.colorHexa,
  }) {
    platformInitial = platformName[0];
    // color = Colors.blue;
  }

  final VoidCallback cardClick;
  final String platformName;
  final String numOfAccounts;
  late final String platformInitial;
  final String colorHexa;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cardClick,
      child: Card(
        elevation: 4,
        surfaceTintColor: Colors.white,
        shape: const RoundedRectangleBorder(
          side: BorderSide(width: 0),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: Color(int.parse(colorHexa, radix: 16)),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Text(
                  platformInitial,
                  style: TextStyles.font26WhiteBold,
                ),
              ),
              verticalSpace(10),
              Text(platformName,
                  style: TextStyles.font15BlackPurpleMedium
                      .copyWith(fontFamily: FontWeightHelper.semiBold)),
              Text(
                "$numOfAccounts Accounts",
                style: TextStyles.font11DarkGreyRegular,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
