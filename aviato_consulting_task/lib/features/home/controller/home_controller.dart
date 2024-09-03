import 'dart:developer';

import 'package:aviato_consulting_task/features/details/view/details_view.dart';
import 'package:aviato_consulting_task/utils/logic/networking/app_popups.dart';
import 'package:aviato_consulting_task/utils/logic/networking/app_urls.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:openapi/openapi.dart';

class HomeController extends GetxController {
// Private Instance: PetApi.
  final PetApi _petApi =
      PetApi(Dio(BaseOptions(baseUrl: AppUrls.kBaseUrl)), standardSerializers);

  /// Instance: Pet.
  Pet? pet;

  /// Method: Get Pet Details Based On User Entered ID.
  Future<void> getPetDetailsByID({required String petID}) async {
    try {
      AppPopups.showDialog();
      final int _petID = int.parse(petID);
      final response = await _petApi.getPetById(petId: _petID);
      log('$response', name: 'HomeController getPetDetailsByID response');
      if (response.data == null) {
        throw 'Server returned empty data';
      }
      pet = response.data!;

      AppPopups.cancelDialog();
      // Navigating to  DetailsView.
      Get.to(() => DetailsView());
    } on DioException catch (dioError) {
      log('$dioError', name: 'HomeController getPetDetailsByID DioException');
      AppPopups.cancelDialog();
      AppPopups.errorSnackbar(message: '${dioError.response?.statusCode}');
    } catch (error) {
      log('$error', name: 'HomeController getPetDetailsByID catch');
      AppPopups.cancelDialog();
      AppPopups.errorSnackbar(message: '$error');
    }
  }
}
