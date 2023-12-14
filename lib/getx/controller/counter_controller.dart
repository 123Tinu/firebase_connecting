import 'package:get/state_manager.dart';

class CounterController extends GetxController {
  RxInt count = 0.obs;

  void incCount() {
    count = count + 1;
  }

  void decCount() {
    count = count - 1;
  }
}
