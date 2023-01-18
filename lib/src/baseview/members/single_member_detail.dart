import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarf/controllers/members/members_controller.dart';
import 'package:sarf/src/baseview/members/chat/view/chat_view.dart';
import 'package:sarf/src/utils/routes_name.dart';

import '../../../constant/api_links.dart';
import '../../../resources/resources.dart';
import '../../widgets/custom_appbar.dart';
import '../Invoices/invoice_details.dart';

class SingleMemberDetails extends StatefulWidget {
  final String title;
  final String id;
  const SingleMemberDetails({super.key, required this.title, required this.id});

  

  @override
  State<SingleMemberDetails> createState() => _SingleMemberDetailsState();
}

class _SingleMemberDetailsState extends State<SingleMemberDetails> {
  MembersController ctr = Get.find<MembersController>();
  @override
  void initState() {
    ctr.getMemberDetails(widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.lightGrey,
      body: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            customAppBar(widget.title,true,false,'',false),
            //appbarSearch(),
            //const SizedBox(height: 10,),
            if(ctr.loadingMemDetails.value == true)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(child: SizedBox(width: 50,height: 50,child: CircularProgressIndicator(color: R.colors.blue),),),
            ),
            if(ctr.loadingMemDetails.value == false && ctr.memDetails.value.data == null)
            Center(child: Text('No Data',style: TextStyle(fontSize: 16),),),
            if(ctr.memDetails.value.data != null)...[
              Transform(
            transform: Matrix4.translationValues(0, -10, 0),
             child: Container(
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: R.colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: R.colors.blackSecondery,width: 1)
                          ),
                           child: ctr.memDetails.value.data?.photo != null? Image.network("${ApiLinks.assetBasePath}${ctr.memDetails.value.data?.photo}") : Container(width: 40,height: 40,)
                          // CircleAvatar(
                          //   radius: 25,
                          //   backgroundImage: AssetImage(R.images.pharmacy),
                          // ),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(ctr.memDetails.value.data?.name ?? '',style: TextStyle(color: R.colors.black,fontSize: 16),),
                            const SizedBox(height: 8,),
                            Row(
                              children: [
                                Text('Invoices',style: TextStyle(color: R.colors.grey,fontSize: 14),),
                                const SizedBox(width: 10,),
                                Text(ctr.memDetails.value.data?.invoicesCount ?? '0',style: TextStyle(color: R.colors.black,fontSize: 14),),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                Text('Amounts',style: TextStyle(color: R.colors.grey,fontSize: 14),),
                                const SizedBox(width: 10,),
                                Text(ctr.memDetails.value.data?.invoicesSumAmount ?? '0',style: TextStyle(color: R.colors.black,fontSize: 14),),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Divider(
                              color: R.colors.grey,
                              thickness: 1,
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: Row(
                                  children: [
                                    Icon(Icons.location_on_sharp,size: 20,color: R.colors.black,),
                                    const SizedBox(width: 8,),
                                    Flexible(
                                      child: Text(ctr.memDetails.value.data?.userDetail?.location ?? '',
                                      style:TextStyle(color: R.colors.black,fontSize: 14),
                                      overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                )),
                                const SizedBox(width: 3,),
                                Row(
                                  children: [
                                    Text('Directions',
                                      style:TextStyle(color: R.colors.themeColor,fontSize: 14,fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(width: 5,),
                                      Icon(Icons.directions,color: R.colors.themeColor,size: 20,),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(R.images.twitter,width: 30,height: 30,),
                                    const SizedBox(width: 5,),
                                    Image.asset(R.images.insta,width: 30,height: 30,),
                                    const SizedBox(width: 5,),
                                    Image.asset(R.images.web,width: 30,height: 30,),
                                    const SizedBox(width: 5,),
                                    Image.asset(R.images.whatsapp,width: 30,height: 30,),
                                    const SizedBox(width: 5,),
                                    Image.asset(R.images.call,width: 30,height: 30,),
                                    const SizedBox(width: 5,),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () => Get.to(() =>  ChatScreen(title: ctr.memDetails.value.data?.name ?? '',email: ctr.memDetails.value.data!.mobile.toString(),)),
                                  child: Row(children: [
                                    Text('chat',style: TextStyle(color: R.colors.themeColor,fontSize: 14),),
                                    const SizedBox(width: 4,),
                                    Icon(Icons.chat,color: R.colors.themeColor,size: 15,),
                                  ],),
                                )
                                
                            ],)
                          ],
                        )),
                      ],
                    ),
                  ),
           ),
           const SizedBox(height: 10,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 12),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Title for the list below',style: TextStyle(color: R.colors.black,fontSize: 14,fontWeight: FontWeight.w500),),
                Row(children: [
                  Image.asset(R.images.listStack,width: 20,height: 20,),
                  const SizedBox(width: 20,),
                  Image.asset('assets/images/data.png',width: 20,height: 20,color: R.colors.black,),
                ],),
              ],
             ),
           ),
           Expanded(
             child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
              shrinkWrap: true,
              itemCount: ctr.memDetails.value.data?.invoices?.length,
              itemBuilder: (context,index){
                var data = ctr.memDetails.value.data?.invoices?[index];
               return  Container(
                margin: const EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: R.colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Invoice No',style: TextStyle(color: R.colors.grey,fontSize: 14,fontWeight: FontWeight.w500),),
                      // Text(data.,style: TextStyle(color: R.colors.grey,fontSize: 14,fontWeight: FontWeight.w500),),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Text(data!.id.toString(),style: TextStyle(color: R.colors.black,fontSize: 14,fontWeight: FontWeight.w500),),
                  const SizedBox(height: 10,),
                  Text('Amount',style: TextStyle(color: R.colors.grey,fontSize: 14,fontWeight: FontWeight.w500),),
                  const SizedBox(height: 5,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text( data.amount.toString(),style: TextStyle(color: R.colors.black,fontSize: 14,fontWeight: FontWeight.w500),),
                      GestureDetector(
                        onTap: () => Get.to( () => InvoiceDetails(id: data.id.toString(),) ),
                        child: Text('Details',style: TextStyle(color: R.colors.themeColor,fontSize: 14,
                        decoration: TextDecoration.underline,fontWeight: FontWeight.w500,
                        ),
                        
                        ),
                      ),
                    ],
                  ),
                 
                ],
              ),
             );
              }),
           )
            ],
           
          ],
        ),
      ),
    );
  }
}