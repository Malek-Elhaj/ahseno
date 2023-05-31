import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:designapp/Layout/layoutScreen.dart';
import 'package:designapp/Shared/Components.dart';
import 'package:designapp/Shared/Cubit/cubit.dart';
import 'package:designapp/Shared/Style.dart';
import 'package:flutter/material.dart';

class ShopCartScreen extends StatelessWidget {
   ShopCartScreen({Key? key}) : super(key: key);

  final scaffoldkey=GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {


    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
         key: scaffoldkey,
        appBar: defaultAppBar(
            title: "السلة",
            leadingicon: Icons.close,
            context: context
        ),
        body: ConditionalBuilder(
          condition: false,
          builder: (BuildContext context) {
            return  Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemBuilder: (context,index)=>
                          defaultShopCardItem
                              (
                              image: 'Assets/images/SliderImages/muslims-reading-from-quran.jpg',
                              itemTitle: 'صيانة اكادمية القران',
                              leftnumber: '192,493',
                              function: () {

                              },
                            ),
                    itemCount: 10,
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        blurStyle: BlurStyle.outer
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DefaultButton(
                        Function: (){
                         DefaultPaymentBottomSheet(context);
                        }, ButtonText: "انهاء عملية التبرع "),
                  ),
                )
              ],
            );
          },
          fallback: (BuildContext context) {
            return  Center(
                child:  SizedBox(
                  height: 450,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                       const Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "Assets/106964-shake-a-empty-box.gif",
                          ),
                      ),
                       const SizedBox(height: 20,),
                       Text(
                          "ليس لديك تبرعات مضافة",
                        style: TextStyle(
                          color: AppColors.CustomGrey,
                          fontSize: 22
                        ),
                      ),
                       const SizedBox(height: 20,),
                       DefaultButton(
                          Function: (){
                            Cubit_Class.get(context).changeScreen(1);
                            Navigator.pop(context);
                          },
                          ButtonText: "استعرض التبرعات"
                      )
                    ],
                  ),
                )
            );
          },
        ) ,

      ),
    );
  }
}
