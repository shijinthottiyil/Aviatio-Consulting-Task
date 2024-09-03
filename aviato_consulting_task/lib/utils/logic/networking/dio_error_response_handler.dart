import 'app_popups.dart';
import 'package:dio/dio.dart';

class DioErrorResponseHandler {
  DioErrorResponseHandler._();
  static void dioError(
      {required Response? response,
      Map<int, String> customMessage = const {}}) {
    AppPopups.cancelDialog();
    switch (response?.statusCode ?? 0) {
      case 400:
        AppPopups.errorSnackbar(
          message: customMessage.containsKey(400)
              ? customMessage[400].toString()
              : response!.statusMessage.toString(),
        );
        break;
      case 401:
        AppPopups.errorSnackbar(
          message: customMessage.containsKey(401)
              ? customMessage[401].toString()
              : response!.statusMessage.toString(),
        );
        break;
      case 402:
        AppPopups.errorSnackbar(
          message: customMessage.containsKey(402)
              ? customMessage[402].toString()
              : response!.statusMessage.toString(),
        );
        break;
      case 404:
        AppPopups.errorSnackbar(
          message: customMessage.containsKey(404)
              ? customMessage[404].toString()
              : response!.statusMessage.toString(),
        );
        break;
      case 406:
        AppPopups.errorSnackbar(
          message: customMessage.containsKey(406)
              ? customMessage[406].toString()
              : response!.statusMessage.toString(),
        );
        break;
      case 501:
        AppPopups.errorSnackbar(
          message: customMessage.containsKey(501)
              ? customMessage[501].toString()
              : response!.statusMessage.toString(),
        );
        break;
      default:
        AppPopups.errorSnackbar(message: 'unhandled response code');
    }
  }
}
