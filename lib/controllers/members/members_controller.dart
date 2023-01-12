import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sarf/model/members/city_list_model.dart';

import '../../constant/api_links.dart';
import '../../model/members/member_details_model.dart';
import '../../model/members/members_list_model.dart';
import '../../model/members/members_list_new_model.dart';
import '../../model/members/single_invoice_model.dart';
import '../../resources/resources.dart';
import '../../services/app_exceptions.dart';
import '../../services/dio_client.dart';
import 'package:dio/dio.dart' as deo;

import '../../src/widgets/loader.dart';

class MembersController extends GetxController{

  var loadingMemDetails = false.obs;
  var loadingInvoiceDetails = false.obs;
  Rx<MemberDetails> memDetails = MemberDetails().obs;
  Rx<SingleInvoiceDetails> inVoiceDetails = SingleInvoiceDetails().obs;
  List<File> uploadImages = <File>[].obs;

@override
void onInit(){
  //getMembersList();
  super.onInit();


}

  Future<MembersList?> getMembersList() async {
    //print("${ApiLinks.membersList}${GetStorage().read('lang')}");
   // openLoader();
    var response =
        await DioClient().get("${ApiLinks.membersList}${GetStorage().read('lang')}").catchError((error) {
      if (error is BadRequestException) {
        
        
       // print(error.toString());
      } else {

        //print(error.toString());
        
    if (error is BadRequestException) {
     // print(error.toString());
      
    } else if (error is FetchDataException) {
     // print(error.toString());
      
    } else if (error is ApiNotRespondingException) {
      //print(error.message.toString());
    }

      }
    }); 
    if (response['success'] == true) {
     
      debugPrint(response.toString());
        var membersList = MembersList.fromJson(response);
        //print(membersList.data?.first.expenseName);
        return membersList;
    } else {
      debugPrint('here');
    }
    return null;
  }

  Future<CityList?> getCityList() async {
   // print("${ApiLinks.cityList}${GetStorage().read('lang')}");
   // openLoader();
    var response =
        await DioClient().get("${ApiLinks.cityList}${GetStorage().read('lang')}").catchError((error) {
      if (error is BadRequestException) {
        
        
        debugPrint(error.toString());
      } else {

        debugPrint(error.toString());
        
    if (error is BadRequestException) {
      debugPrint(error.toString());
      
    } else if (error is FetchDataException) {
      debugPrint(error.toString());
      
    } else if (error is ApiNotRespondingException) {
      debugPrint(error.message.toString());
    }

      }
    }); 
    if (response['success'] == true) {
     
      debugPrint(response.toString());
        var cityList = CityList.fromJson(response);
        //print(membersList.data?.first.expenseName);
        return cityList;
    } else {
      debugPrint('here');
    }
    return null;
  }

  Future<ListMembersNewList?> getMembersNewList(String id) async {
   // print("${ApiLinks.cityList}${GetStorage().read('lang')}");
   // openLoader();
   var request = {
    "language": GetStorage().read('lang'),
    "expense_type_id": id,
   };
   debugPrint(request.toString());
    var response =
        await DioClient().post(ApiLinks.memberNewList,request).catchError((error) {
      if (error is BadRequestException) {
        
        
        debugPrint(error.toString());
      } else {

        debugPrint(error.toString());
        
    if (error is BadRequestException) {
      debugPrint(error.toString());
      
    } else if (error is FetchDataException) {
      debugPrint(error.toString());
      
    } else if (error is ApiNotRespondingException) {
      debugPrint(error.message.toString());
    }

      }
    }); 
    debugPrint(response.toString());
    if (response['success'] == true) {
      print("aaaaaaaaaaaaaaaaaassssssssssssssssssssssss");
      //debugPrint(response.toString());
        var listNew = ListMembersNewList.fromJson(response);
        print("aaaaaaaaaaaaaaaaaassssssssssssssssssssssss${listNew.data.toString()}");
        return listNew;
    } else {
      debugPrint('here');
    }
    return null;
  }

Future getMemberDetails(String id) async {
  memDetails.value = MemberDetails();
   // print("${ApiLinks.cityList}${GetStorage().read('lang')}");
   // openLoader();
   loadingMemDetails.value = true;
   var request = {
    "language": GetStorage().read('lang'),
    "member_id": id,
   };
   debugPrint(request.toString());
    var response =
        await DioClient().post(ApiLinks.memberDetails,request).catchError((error) {
          loadingMemDetails.value = false;
      if (error is BadRequestException) {
        
        
        debugPrint(error.toString());
      } else {

        debugPrint(error.toString());
        
    if (error is BadRequestException) {
      debugPrint(error.toString());
      
    } else if (error is FetchDataException) {
      debugPrint(error.toString());
      
    } else if (error is ApiNotRespondingException) {
      debugPrint(error.message.toString());
    }

      }
    }); 
    debugPrint(response.toString());
    if (response['success'] == true) {
      loadingMemDetails.value = false;
      print("aaaaaaaaaaaaaaaaaassssssssssssssssssssssss");
      //debugPrint(response.toString());
        var listNew = MemberDetails.fromJson(response);
        print("aaaaaaaaaaaaaaaaaassssssssssssssssssssssss${listNew.data.toString()}");
        memDetails.value = listNew;
    } else {
      loadingMemDetails.value = false;
      debugPrint('here');
    }
    return null;
  }

  Future getInvoiceDetail(String id) async {
  
   // print("${ApiLinks.cityList}${GetStorage().read('lang')}");
   // openLoader();
   loadingInvoiceDetails.value = true;
   inVoiceDetails.value = SingleInvoiceDetails();
   var request = {
    "language": GetStorage().read('lang'),
    "invoice_id": id,
   };
   debugPrint(request.toString());
    var response =
        await DioClient().post(ApiLinks.invoiceDetails,request).catchError((error) {
          loadingMemDetails.value = false;
      if (error is BadRequestException) {
        
        
        debugPrint(error.toString());
      } else {

        debugPrint(error.toString());
        
    if (error is BadRequestException) {
      debugPrint(error.toString());
      
    } else if (error is FetchDataException) {
      debugPrint(error.toString());
      
    } else if (error is ApiNotRespondingException) {
      debugPrint(error.message.toString());
    }

      }
    }); 
    debugPrint(response.toString());
    if (response['success'] == true) {
      
      loadingInvoiceDetails.value = false;
      print("aaaaaaaaaaaaaaaaaassssssssssssssssssssssss");
      //debugPrint(response.toString());
        var invoice = SingleInvoiceDetails.fromJson(response);
        print("aaaaaaaaaaaaaaaaaassssssssssssssssssssssss${invoice.data?.id}");
        inVoiceDetails.value = invoice;
    } else {
      loadingInvoiceDetails.value = false;
      debugPrint('here');
    }
    return null;
  }

Future postInvoiceAttach(String id) async {
  openLoader();
    // Map<String,dynamic> request = {
    //   'language': storage.read('lang'),
    //   'category_id': homeController.myCategories[categoryIndex.value].id,
    //   'sub_category_id': homeController.myCategories[categoryIndex.value]
    //       .subCategories![subCategoryIndex.value].id,
    //   'title': titleCtrl.text,
    //   'price': priceCtrl.text,
    //   'country_id': storage.read('country_id'),
    //   'city_id': storage.read('city_id'),
    //   'description': descCtrl.text,
    //   'images': images,
    // };
    // for(int i=0;i<images.length;i++){
    //     request.addAll({"images[$i]":images[i]});
    //   }
    //  print(request);
   
    deo.FormData formData = deo.FormData();
    
for (var i = 0; i < uploadImages.length; i++) {
  var file = uploadImages[i];
  String fileName = file.path.split('/').last;
  formData.files.add(
    MapEntry("file_attach[$i]", await deo.MultipartFile.fromFile(file.path, filename: fileName))
   );
}
  formData.fields.add(MapEntry('language', GetStorage().read('lang').toString()));
  formData.fields.add(MapEntry('invoice_id', id));
  debugPrint(formData.fields.toString());
  
   //debugPrint(formData.files.first.toString());
    
    //Dio http = API.getInstance();
    var response = await DioClient()
        .post(ApiLinks.invoiceAttach, formData,true)
        .catchError((error) {
          Get.back();
      if (error is BadRequestException) {
        
        var apiError = json.decode(error.message!);
        debugPrint("aaaaaaaa${error.toString()}");
        Get.snackbar('Error', apiError["reason"].toString());
        //DialogBoxes.showErroDialog(description: apiError["reason"]);
      } else {
        Get.snackbar('Error', 'Something went wrong');
        debugPrint("aaaaaaaa${error.toString()}");
        //Navigator.of(getpackage.Get.context!).pop();
        //HandlingErrors().handleError(error);
      }
    });

    // final response = await http.post(ApiLinks.addNewAdApi,data: formData );
    
     
      debugPrint("aaaaaaaaaaa$response");
    // Navigator.of(getpackage.Get.context!).pop();
    if (response == null) return;
    if (response['success']) {
      Get.back();
      //SnakeBars.showSuccessSnake(description: response['message'].toString());
      Get.snackbar('Success', response['message'].toString());
      uploadImages.clear();
      //Get.back();
      //files.clear();
      getInvoiceDetail(id);
      
      
    } else {
      
      debugPrint('here');
      (response.containsKey('validation_errors'))
          ? Get.snackbar(response['message'].toString(), response['validation_errors'].toString())
          // SnakeBars.showValidationErrorSnake(
          //     title: response['message'].toString(),
          //     description: response['validation_errors'].toString())
          : Get.snackbar('Success', response['message'].toString());
          //SnakeBars.showErrorSnake(description: response['message'].toString());
      Navigator.of(Get.context!).pop();
    }
  }


}


