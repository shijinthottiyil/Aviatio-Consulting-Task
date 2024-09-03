import 'dart:ui';

import 'package:aviato_consulting_task/utils/ui/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: AppPadding.padSymmetricHorizontal8,
          decoration: BoxDecoration(
            color: AppColors.kWhite,
            borderRadius: AppBorderRadius.circular4,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                AppAssets.kAnimatedCircularProgressLoaderLottie,
                width: 50,
                height: 50,
                repeat: true,
              ),
              Material(
                child: Text(
                  'Loading...',
                  style: AppTypography.kBold12,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
