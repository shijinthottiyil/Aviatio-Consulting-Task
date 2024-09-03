import 'package:aviato_consulting_task/features/home/controller/home_controller.dart';
import 'package:aviato_consulting_task/utils/ui/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openapi/openapi.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView>
    with SingleTickerProviderStateMixin {
  // Animations
  late final AnimationController _animationController = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final CurvedAnimation _animation = CurvedAnimation(
    parent: _animationController,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final HomeController _homeController = Get.find<HomeController>();
    final Pet pet = _homeController.pet!;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        title: Text(
          pet.category?.name?.toUpperCase() ?? '',
          style: AppTypography.kBold20.copyWith(
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Container(
            width: 300,
            height: 200,
            padding: AppPadding.padAll8,
            decoration: BoxDecoration(
              color: AppColors.kWhite,
              borderRadius: AppBorderRadius.circular12,
              boxShadow: [
                BoxShadow(
                  color: AppColors.kGray.withOpacity(0.3),
                  spreadRadius: 0,
                  blurRadius: 0,
                  offset: const Offset(5, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Details',
                  style: AppTypography.kBold20.copyWith(
                    letterSpacing: 1.5,
                  ),
                ),
                const Divider(
                  thickness: 3,
                  color: AppColors.kGray,
                ),
                AppSpacing.gapH8,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pet ID',
                      style: AppTypography.kRegular12.copyWith(
                        letterSpacing: 2,
                        color: AppColors.kGray,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${pet.id}',
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.kBold16.copyWith(
                          letterSpacing: 2,
                          color: AppColors.kGray,
                        ),
                      ),
                    )
                  ],
                ),
                AppSpacing.gapH8,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pet type',
                      style: AppTypography.kRegular12.copyWith(
                        letterSpacing: 2,
                        color: AppColors.kGray,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${pet.name}',
                        textAlign: TextAlign.end,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.kBold16.copyWith(
                          letterSpacing: 2,
                          color: AppColors.kGray,
                        ),
                      ),
                    )
                  ],
                ),
                AppSpacing.gapH8,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pet Status',
                      style: AppTypography.kRegular12.copyWith(
                        letterSpacing: 2,
                        color: AppColors.kGray,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${pet.status}',
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.kBold16.copyWith(
                          letterSpacing: 2,
                          color: AppColors.kGray,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
