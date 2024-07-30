
import 'package:demogetapi/model/cart/cart.dart';
import 'package:demogetapi/view/api/apiservice.dart';
import 'package:get/get.dart';

class Cartcontroller extends GetxController {
  var Clist = <Carts>[].obs;

  Future<void> fetchdata() async {
    Apiservice apiService = Apiservice();
    var fetchedList = await apiService.fetchData();

    if (fetchedList != null) {
      Clist.value = fetchedList;
      update();
    }
  }
}