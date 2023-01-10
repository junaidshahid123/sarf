import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sarf/model/home/home_model.dart';

import '../../constant/api_links.dart';
import '../../resources/resources.dart';
import '../../services/app_exceptions.dart';
import '../../services/dio_client.dart';
import '../../src/widgets/loader.dart';

class HomeController extends GetxController{

var loading = false.obs; 
List budgets = <Budgets>[].obs;
var selectedBudgetIndex = 0.obs;
var totalInvoices = ''.obs;
var totalExpanses = ''.obs;

@override
void onInit() async{
  await getHome();
  super.onInit();

  
}

Future getHome() async {
    //print("${ApiLinks.membersList}${GetStorage().read('lang')}");
   // openLoader();
   loading.value = true;
   var request = {
    "language": GetStorage().read('lang'),
   };
    var response =
        await DioClient().post(ApiLinks.getHome, request).catchError((error) {
      if (error is BadRequestException) {
        loading.value = false;
         var apiError = json.decode(error.message!);
        Get.snackbar(
          'Error'.tr,
          apiError["reason"].toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: R.colors.themeColor,
        );
       // print(error.toString());
      } else {
        loading.value = false;
      if (error is BadRequestException) {
      var message = error.message;
      Get.snackbar(
          'Error'.tr,
          message.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: R.colors.themeColor,
        );
    } else if (error is FetchDataException) {
      var message = error.message;
      Get.snackbar(
          'Error'.tr,
          message.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: R.colors.themeColor,
        );
    } else if (error is ApiNotRespondingException) {
      
      Get.snackbar(
          'Error'.tr,
          'Oops! It took longer to respond.'.tr,
          snackPosition: SnackPosition.TOP,
          backgroundColor: R.colors.themeColor,
        );
    }

      }
    }); 
    if (response['success'] == true) {
      loading.value = false;
      budgets.clear();
      debugPrint(response.toString());
        var data = HomeData.fromJson(response);
        print( " asasasasasas ${data.data?.budgets?.length.toString()}" );
        if(data.data != null){
          for (var budget in data.data!.budgets!) {
          budgets.add(budget);
        }
        }
        totalInvoices.value = data.data!.totalInvoices.toString();
        totalExpanses.value = data.data!.totalExpenses.toString();
        //print(budgets.first.name);
        
       // return data;
    } else {
      debugPrint('here');
    }
    return null;
  }

  Future addBudget(String name) async {
    //print("${ApiLinks.membersList}${GetStorage().read('lang')}");
    openLoader();
   
   var request = {
    "language": GetStorage().read('lang'),
    "name": name,
   };
    var response =
        await DioClient().post(ApiLinks.addBudget, request).catchError((error) {
      if (error is BadRequestException) {
        Get.back();
       
         var apiError = json.decode(error.message!);
        Get.snackbar(
          'Error'.tr,
          apiError["reason"].toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: R.colors.themeColor,
        );
       // print(error.toString());
      } else {
        Get.back();
        
      if (error is BadRequestException) {
      var message = error.message;
      Get.snackbar(
          'Error'.tr,
          message.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: R.colors.themeColor,
        );
    } else if (error is FetchDataException) {
      var message = error.message;
      Get.snackbar(
          'Error'.tr,
          message.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: R.colors.themeColor,
        );
    } else if (error is ApiNotRespondingException) {
      
      Get.snackbar(
          'Error'.tr,
          'Oops! It took longer to respond.'.tr,
          snackPosition: SnackPosition.TOP,
          backgroundColor: R.colors.themeColor,
        );
    }

      }
    }); 
    if (response['success'] == true) {
      Get.back();
      debugPrint(response.toString());
      getHome();
      Get.back();

    } else {
      Get.back();
      debugPrint('here');
    }
    return null;
  }


}