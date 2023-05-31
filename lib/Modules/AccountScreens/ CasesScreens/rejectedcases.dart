import 'package:designapp/Modules/sectionsScreens/describtionScreen.dart';
import 'package:designapp/Services/CubitServices/DataCubitServices/SectionsCubit/sections_cubit.dart';
import 'package:designapp/Shared/Components.dart';
import 'package:designapp/Shared/Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RejectedCasesScreen extends StatefulWidget {
  const RejectedCasesScreen({Key? key}) : super(key: key);

  @override
  State<RejectedCasesScreen> createState() => _RejectedCasesScreenState();
}

class _RejectedCasesScreenState extends State<RejectedCasesScreen> {
  List<Map<String, dynamic>> rejected=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<SectionsCubit>(context).getInprogress();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: defaultAppBar(title: "الحالات المرفوضة", context: context),
        body: BlocBuilder<SectionsCubit, SectionsState>(
  builder: (context, state) {
    if(state is CasesLoaded && rejected.length>0) {
      rejected = (state).rejected;
      return ListView.separated(
          itemBuilder: (context, index) =>
              differentcaseCard(
                image: 'Assets/images/SliderImages/muslims-reading-from-quran.jpg',
                itemTitle: "${rejected[index]["title"]}",
                leftnumber: "${rejected[index]["req"]}",
                ontab: () {
                  showModalBottomSheet(
                      shape: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                      ),
                      context: context,
                      builder: (context) =>
                          SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "سبب رفض الحالة الخاصة بك لانه المسجد غير مسجل في اوقافسبب رفض الحالة الخاصة بك لانه المسجد غير مسجل في اوقافسبب رفض الحالة الخاصة بك لانه المسجد غير مسجل في اوقافسبب رفض الحالة الخاصة بك لانه المسجد غير مسجل في اوقاف",
                                    style: TextStyle(
                                        color: AppColors.CustomGrey
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                  );
                },
                bottomtitle: 'سبب رفض الحالة الخاصة بك لانه المسجد غير مسجل في اوقاف',
              ),
          separatorBuilder: (context, index) => const SizedBox(height: 10,),
          itemCount: rejected.length
      );
    }
    else{
      return Center(child: Text("لا توجد حالات مرفوضة"));
    }
  },
),
      ),
    );
  }
}
