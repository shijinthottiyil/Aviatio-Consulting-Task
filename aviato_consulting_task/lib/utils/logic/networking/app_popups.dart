import 'package:aviato_consulting_task/utils/ui/constants/constants.dart';
import 'package:aviato_consulting_task/utils/ui/widgets/loading_dialog.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppPopups {
  static void errorSnackbar({required String message}) {
    Get.closeAllSnackbars();
    Get.snackbar(
      AppTexts.kTitle,
      message,

      // backgroundColor: AppColors.kGreen,
      titleText: Text(
        message,
        style: AppTypography.kBold16.copyWith(
          color: AppColors.kBlack,
          letterSpacing: 2,
        ),
      ),
      messageText: const SizedBox.shrink(),
      icon: Padding(
        padding: AppPadding.padAll4,
        child: Lottie.asset(
          AppAssets.kErrorLottie,
        ),
      ),
      margin: AppPadding.padSymmetricHorizontal20,
      borderRadius: 4,
    );
  }

  static void infoSnackbar({required String title, required String message}) {
    Get.closeAllSnackbars();
    Get.snackbar(
      title,
      message,
    );
  }

  static void successSnackbar(
      {required String message,
      Duration? duration = const Duration(seconds: 3)}) {
    Get.closeAllSnackbars();
    Get.snackbar(
      AppTexts.kTitle,
      message,

      // backgroundColor: AppColors.kGreen,
      titleText: Text(
        message,
        style: AppTypography.kBold16.copyWith(
          color: AppColors.kBlack,
          letterSpacing: 2,
        ),
      ),
      messageText: const SizedBox.shrink(),
      icon: Padding(
        padding: AppPadding.padAll4,
        child: Lottie.asset(
          AppAssets.kSuccessLottie,
        ),
      ),
      margin: AppPadding.padSymmetricHorizontal20,
      borderRadius: 4,
    );
  }

  // Loader
  static Future<void> showDialog({bool isDismissible = true}) async {
    await Get.dialog(
      const LoadingDialog(),
      useSafeArea: true,
      barrierDismissible: isDismissible,
    );
  }

  // Cancel Loader
  static void cancelDialog() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }

  /// Method to close BottomSheet.
  static void cancelBottomSheet() {
    if (Get.isBottomSheetOpen ?? false) {
      Get.back();
    }
  }
}
