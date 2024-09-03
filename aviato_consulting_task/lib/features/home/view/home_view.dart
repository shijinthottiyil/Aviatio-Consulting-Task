import 'package:aviato_consulting_task/features/home/controller/home_controller.dart';
import 'package:aviato_consulting_task/utils/logic/networking/app_popups.dart';
import 'package:aviato_consulting_task/utils/ui/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // TextEditingControllers
  TextEditingController _petIDEditingController = TextEditingController();

  // GetxControllers.
  final HomeController _homeController = Get.find<HomeController>();

  @override
  void dispose() {
    _petIDEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Petstore',
          style: AppTypography.kBold20.copyWith(
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Container(
          margin: AppPadding.padSymmetricHorizontal16,
          padding: AppPadding.padAll16,
          decoration: BoxDecoration(
            color: AppColors.kWhite,
            borderRadius: AppBorderRadius.circular16,
            boxShadow: [
              BoxShadow(
                color: AppColors.kGray.withOpacity(0.3),
                spreadRadius: 0,
                blurRadius: 0,
                offset: const Offset(5, 5),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _petIDEditingController,
                  style: AppTypography.kBold24.copyWith(
                    letterSpacing: 4,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Enter your pet ID',
                    hintStyle: AppTypography.kRegular16.copyWith(
                      letterSpacing: 2,
                      color: AppColors.kGray,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  // Validation
                  if (_petIDEditingController.text.isEmpty) {
                    AppPopups.errorSnackbar(message: 'Please enter pet ID');
                    return;
                  }
                  if (_petIDEditingController.text == '0') {
                    AppPopups.errorSnackbar(
                        message: 'Enter an ID greater than 0');
                    return;
                  }
                  if (_petIDEditingController.text.length > 3) {
                    AppPopups.errorSnackbar(
                        message: 'Enter a valid pet ID between 1 - 999');
                    return;
                  }
                  await _homeController.getPetDetailsByID(
                      petID: _petIDEditingController.text);
                },
                child: Container(
                  width: 135,
                  height: 35,
                  decoration: ShapeDecoration(
                    shape: StadiumBorder(),
                    color: AppColors.kGray3,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Get Details',
                    style: AppTypography.kBold16.copyWith(
                      letterSpacing: 1,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
