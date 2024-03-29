import 'package:get/get.dart';

class DataService extends GetConnect implements GetxService {
  Future<Response> getData() async {
    Response response = await get("http://localhost:8080/gettasks", headers: {
      "Content-Type": "application/json ; charset=utf-8",
    });

    return response;
  }
}
