import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/resources.dart';
import '../../widgets/custom_appbar.dart';

class MembersListScreen extends StatefulWidget {
  const MembersListScreen({super.key});

  @override
  State<MembersListScreen> createState() => _MembersListScreenState();
}

class _MembersListScreenState extends State<MembersListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.lightGrey,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          customAppBar('Member List',true,true,'(01)'),
          appbarSearch(),
          const SizedBox(height: 10,),
          Expanded(child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (context,index){
            return Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: R.colors.white,
              ),
              child: Row(
                children:  [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: R.colors.blackSecondery,width: 1)
                    ),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(R.images.bottomReceive),
                    ),
                  ),
                ],
              ),
            );
          }))
          // Expanded(child: GridView.builder(
          //           padding: const EdgeInsets.symmetric(horizontal: 12),
          //           gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //             maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
          //             childAspectRatio: 1.8,
          //             mainAxisSpacing: 15,
          //             crossAxisSpacing: 10,
                      
          //           ),
          //           itemCount: 30,
          //            itemBuilder: (context,index){
          //             return ClipRRect(
          //               borderRadius: BorderRadius.circular(10),
          //               child: GestureDetector(
          //                 onTap: (){
                            
          //                 },
          //                 child: Container(
          //                   padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          //                   decoration: const BoxDecoration(
          //                    // borderRadius: BorderRadius.circular(10),
          //                     color: Colors.white,
          //                    // border: Border(left: BorderSide(color: R.colors.lightBlue3,width: 5)),
          //                   ),
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Text('City',style: TextStyle(color: R.colors.grey,fontSize: 12),),
          //                       const SizedBox(height: 5,),
          //                       Text('Madinah',style: TextStyle(color: R.colors.black,fontSize: 16),),
          //                       const SizedBox(height: 5,),
          //                       Row(
          //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                         children: [
          //                           Row(
          //                             children: [
          //                               Icon(Icons.groups,color: R.colors.themeColor,),
          //                               const SizedBox(width: 5,),
          //                               Text('25 Members',style: TextStyle(color: R.colors.themeColor,fontSize: 14),),
          //                             ],
          //                           ),
          //                           Icon(Icons.arrow_forward_ios,color: R.colors.black,size: 15,),
          //                         ],
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //             );
          //     })),
        ],
      ),
    );
  }

  
}