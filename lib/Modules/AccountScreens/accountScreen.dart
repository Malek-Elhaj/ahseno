import 'package:designapp/Modules/AccountScreens/%20CasesScreens/NewCasesUser.dart';
import 'package:designapp/Modules/AccountScreens/%20CasesScreens/casesInprocess.dart';
import 'package:designapp/Modules/AccountScreens/%20CasesScreens/createCaseScreen.dart';
import 'package:designapp/Modules/AccountScreens/%20CasesScreens/rejectedcases.dart';
import 'package:designapp/Modules/AccountScreens/AboutApp/appInfoScreen.dart';
import 'package:designapp/Modules/AccountScreens/AboutApp/feedBackScreen.dart';
import 'package:designapp/Modules/AccountScreens/AboutApp/teachingScreen.dart';
import 'package:designapp/Modules/AccountScreens/AdminScreens/edit&deleteScreen.dart';
import 'package:designapp/Modules/AccountScreens/AdminScreens/managingCases.dart';
import 'package:designapp/Modules/AccountScreens/AdminScreens/newCasesScreen.dart';
import 'package:designapp/Modules/AccountScreens/SettingsScreen/SettingsScreen.dart';
import 'package:designapp/Modules/AuthFiles/Login_Design.dart';
import 'package:designapp/Shared/Components.dart';
import 'package:designapp/Shared/Cubit/cubit.dart';
import 'package:designapp/Shared/Cubit/state.dart';
import 'package:designapp/Shared/Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Shared/constants.dart';
import 'Administrator Screens/CreateAccount.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {





    return BlocConsumer<Cubit_Class,State_Class>(
      listener: (context,index){},
      builder: (context,index){

        Cubit_Class cubit=Cubit_Class.get(context);

        var model =  cubit.user;

        return Scaffold(
          appBar: defaultAppBar(
              title: "الملف الشخصي",
              leadingicon: null,
              icon: Icons.settings,
              buttonfunction: uId != null ? (){
                NavgatetoPage(context: context, page: const SettingsScreen());
              } : (){
                showInfoToast(". قوم بتسجيل الدخول للحصول على صلاحيات ", context);
              }
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(bottom:Radius.circular(40) ),
                        color: AppColors.CustomBlue.withOpacity(0.15),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 40,
                              color: Colors.black.withOpacity(0.16),
                              blurStyle: BlurStyle.outer
                          )
                        ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(right: 25,bottom:5 ),
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              color: HexColor("#D2CFCF").withOpacity(0.25),
                            ),
                            child:  Icon(
                              Icons.account_circle_outlined,
                              size: 40,
                              color: AppColors.CustomGrey,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: uId != null  ? null : (){
                                  NavgatetoPage(context: context, page: const LoginScreen());
                                } ,
                                child: Text(
                                  uId == null ? "تسجيل الدخول" :  model.name,
                                  style: TextStyle(
                                      color: AppColors.CustomGrey
                                  ),
                                ),
                              ),
                              const SizedBox(height: 2,),
                              Text(
                                uId ==null ? "تسجيل الدخول للحصول على إمكانية إضافة حالة احتياج":  model.phone,
                                style: TextStyle(
                                    fontSize: 9,
                                    color: AppColors.CustomGrey
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                ),

                // Adimn of the sections
                Visibility(
                  visible: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "أدارة الحالات",
                          style: TextStyle(
                              color: AppColors.CustomGreen
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.16),
                                    blurStyle: BlurStyle.outer
                                )
                              ]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                  child: ListTile(
                                    leading: Text(
                                      "ادارة الحالات",
                                      style: TextStyle(
                                          color: AppColors.CustomGrey
                                      ),
                                    ),
                                    trailing:  Icon(
                                      Icons.arrow_circle_left_outlined,
                                      color: AppColors.CustomBlue,
                                    ),
                                    shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    onTap: (){
                                      NavgatetoPage(context: context, page: const ManagingCasesScreen());
                                    },
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                  child: ListTile(
                                    leading: Text(
                                      "طلبات الحالات الجديدة",
                                      style: TextStyle(
                                          color: AppColors.CustomGrey
                                      ),
                                    ),
                                    trailing:  Icon(
                                      Icons.arrow_circle_left_outlined,
                                      color: AppColors.CustomBlue,
                                    ),
                                    shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    onTap: (){
                                      NavgatetoPage(context: context, page: const NewCasesScreen());
                                    },

                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                  child: ListTile(
                                    leading: Text(
                                      "طلبات الحذف و التعديل",
                                      style: TextStyle(
                                          color: AppColors.CustomGrey
                                      ),
                                    ),
                                    trailing:  Icon(
                                      Icons.arrow_circle_left_outlined,
                                      color: AppColors.CustomBlue,
                                    ),
                                    shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    onTap: (){
                                      NavgatetoPage(context: context, page:  EditCasesScreen());
                                    },
                                  ),
                                ),


                                /* Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                          child: ListTile(
                            leading: Text(
                              "طلبات التاكيد من الرفض",
                              style: TextStyle(
                                  color: AppColors.CustomGrey
                              ),
                            ),
                            trailing:  Icon(
                              Icons.arrow_circle_left_outlined,
                              color: AppColors.CustomBlue,
                            ),
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),*/
                              ],
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "إدارة النظام",
                          style: TextStyle(
                              color: AppColors.CustomGreen
                          ),
                        ),
                      ),

                      const SizedBox(height: 10,),


                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.16),
                                    blurStyle: BlurStyle.outer
                                )
                              ]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                  child: ListTile(
                                    leading: Text(
                                      "إنشاء حساب مدير قسم",
                                      style: TextStyle(
                                          color: AppColors.CustomGrey
                                      ),
                                    ),
                                    trailing:  Icon(
                                      Icons.arrow_circle_left_outlined,
                                      color: AppColors.CustomBlue,
                                    ),
                                    shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    onTap: (){
                                      NavgatetoPage(context: context, page: const CreateAccount());
                                    },
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                  child: ListTile(
                                    leading: Text(
                                      "تعديل بيانات مدير القسم",
                                      style: TextStyle(
                                          color: AppColors.CustomGrey
                                      ),
                                    ),
                                    trailing:  Icon(
                                      Icons.arrow_circle_left_outlined,
                                      color: AppColors.CustomBlue,
                                    ),
                                    shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    onTap: (){
                                      NavgatetoPage(context: context, page: const NewCasesScreen());
                                    },

                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                  child: ListTile(
                                    leading: Text(
                                      "حدف حساب مدير القسم",
                                      style: TextStyle(
                                          color: AppColors.CustomGrey
                                      ),
                                    ),
                                    trailing:  Icon(
                                      Icons.arrow_circle_left_outlined,
                                      color: AppColors.CustomBlue,
                                    ),
                                    shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    onTap: (){
                                      NavgatetoPage(context: context, page:  EditCasesScreen());
                                    },
                                  ),
                                ),


                                /* Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                          child: ListTile(
                            leading: Text(
                              "طلبات التاكيد من الرفض",
                              style: TextStyle(
                                  color: AppColors.CustomGrey
                              ),
                            ),
                            trailing:  Icon(
                              Icons.arrow_circle_left_outlined,
                              color: AppColors.CustomBlue,
                            ),
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),*/
                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                // Account login
                Visibility(
                  visible:  uId == null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "الحالات الخاصة بك",
                          style: TextStyle(
                              color: AppColors.CustomGreen
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.16),
                                    blurStyle: BlurStyle.outer
                                )
                              ]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                  child: ListTile(
                                    leading: Text(
                                      " أنشاء حالة تبرع",
                                      style: TextStyle(
                                          color: AppColors.CustomGrey
                                      ),
                                    ),
                                    trailing:  Icon(
                                      Icons.arrow_circle_left_outlined,
                                      color: AppColors.CustomBlue,
                                    ),
                                    shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    onTap: (){
                                      NavgatetoPage(context: context, page: const CreateCaseScreen());
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                  child: ListTile(
                                    leading: Text(
                                      "الحالات المضافة",
                                      style: TextStyle(
                                          color: AppColors.CustomGrey
                                      ),
                                    ),
                                    trailing:  Icon(
                                      Icons.arrow_circle_left_outlined,
                                      color: AppColors.CustomBlue,
                                    ),
                                    shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    onTap: (){
                                      NavgatetoPage(context: context, page: const NewCasesUserScreen());
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                  child: ListTile(
                                    leading: Text(
                                      "حالات قيد المراجعه",
                                      style: TextStyle(
                                          color: AppColors.CustomGrey
                                      ),
                                    ),
                                    trailing:  Icon(
                                      Icons.arrow_circle_left_outlined,
                                      color: AppColors.CustomBlue,
                                    ),
                                    shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    onTap: (){
                                      NavgatetoPage(context: context, page: const CasesInProcessScreen());
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                  child: ListTile(
                                    leading: Text(
                                      "الحالات المرفوضة",
                                      style: TextStyle(
                                          color: AppColors.CustomGrey
                                      ),
                                    ),
                                    trailing:  Icon(
                                      Icons.arrow_circle_left_outlined,
                                      color: AppColors.CustomBlue,
                                    ),
                                    shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    onTap: (){
                                      NavgatetoPage(context: context, page: const RejectedCasesScreen());
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "حول التطبيق",
                        style: TextStyle(
                            color: AppColors.CustomGreen
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.16),
                                  blurStyle: BlurStyle.outer
                              )
                            ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                child: ListTile(
                                  leading: Text(
                                    "مركز التعليم",
                                    style: TextStyle(
                                        color: AppColors.CustomGrey
                                    ),
                                  ),
                                  trailing:  Icon(
                                    Icons.arrow_circle_left_outlined,
                                    color: AppColors.CustomBlue,
                                  ),
                                  shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  onTap: (){
                                    NavgatetoPage(context: context, page: const TeachingScreen());
                                  },
                                ),
                              ),
                    /*         Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                child: ListTile(
                                  leading: Text(
                                    "الشكاوي و الملاحظات",
                                    style: TextStyle(
                                        color: AppColors.CustomGrey
                                    ),
                                  ),
                                  trailing:  Icon(
                                    Icons.arrow_circle_left_outlined,
                                    color: AppColors.CustomBlue,
                                  ),
                                  shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  onTap: (){
                                    NavgatetoPage(context: context, page: const FeedBackScreen());
                                  },
                                ),
                              ),    */

                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
                                child: ListTile(
                                  leading: Text(
                                    "معلومات التطبيق",
                                    style: TextStyle(
                                        color: AppColors.CustomGrey
                                    ),
                                  ),
                                  trailing:  Icon(
                                    Icons.arrow_circle_left_outlined,
                                    color: AppColors.CustomBlue,
                                  ),
                                  shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  onTap: (){
                                    NavgatetoPage(context: context, page: const AppInfoScreen());
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );


  }
}
