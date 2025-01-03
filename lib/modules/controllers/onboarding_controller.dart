import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs; // Observable untuk halaman aktif

  void updatePage(int index) {
    currentPage.value = index;
  }
}
