import 'package:designapp/Modules/ShopCart/shopCartScreen.dart';
import 'package:designapp/Modules/sectionsScreens/describtionScreen.dart';
import 'package:designapp/Services/CubitServices/DataCubitServices/CartCubit/cart_cubit.dart';
import 'package:designapp/Services/CubitServices/DataCubitServices/SectionsCubit/sections_cubit.dart';
import 'package:designapp/Services/models/CartCaseModel/CartCase.dart';
import 'package:designapp/Shared/Components.dart';
import 'package:designapp/Shared/Cubit/cubit.dart';
import 'package:designapp/Shared/Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class SectionsScreen extends StatefulWidget {
  const SectionsScreen({Key? key}) : super(key: key);

  @override
  State<SectionsScreen> createState() => _SectionsScreenState();

}


class _SectionsScreenState extends State<SectionsScreen> {
  List<Map<String, dynamic>> first=[],second=[],last=[];
  List<Map<String, dynamic>> items=[];
  Map<String, dynamic> item=Map();
  //CartCase item=CartCase("", "", "", "");
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<SectionsCubit>(context).getAll();
    items = BlocProvider.of<CartCubit>(context).items;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: defaultAppBar(
            title: "خدمات التبرع",
            icon: Icons.shopping_cart_outlined,
            leadingicon: null,
            buttonfunction: (){
              NavgatetoPage(context: context, page: ShopCartScreen());
            }
        ),
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                width: double.infinity,
                child: TabBar(
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white),
                    isScrollable: false,
                    labelStyle: GoogleFonts.cairo(fontSize: 15),
                    labelColor: AppColors.CustomBlue,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    indicatorColor: AppColors.CustomBlue,
                    indicatorWeight: 2,
                    indicatorPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    unselectedLabelColor: AppColors.CustomGrey,
                    tabs: const [
                      Tab(
                        text: 'المؤونة',
                      ),
                      Tab(
                        text: 'المشاريع الخيرية',
                      ),
               /*       Tab(
                        text: 'مسجونين',
                      ),
                      Tab(
                        text: 'الكفالات',
                      ),  */
                      Tab(
                        text: 'المديونين',
                      ),
                    ]
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  //Default list of items
                      BlocBuilder<SectionsCubit, SectionsState>(
  builder: (context, state) {
    if(state is SectionsLoaded){
    first = (state).first;
    return ListView.separated(
                          itemBuilder: (context,index)=> defaultCardItem(
                              image: "Assets/images/SliderImages/muslims-reading-from-quran.jpg",
                              itemTitle: "${first[index]["title"]}",
                              leftnumber: (first[index]["req"]-first[index]["total"]).toString()+" د.ل ",
                              percent: 1,
                              percentvalue: (first[index]["total"]/first[index]["req"]*100).toStringAsFixed(2),
                              percentcolor: "#45C4B0",
                              function: (){
                                 DefaultPaymentBottomSheet(context);
                                },
                              function2: (){
                                item['id']=first[index]["id"];
                                item['title']=first[index]["title"];
                                item['stay']=(first[index]["req"]-first[index]["total"]).toString();
                                item['section']=first[index]["section"];
                                //item=CartCase(first[index]["id"], first[index]["title"], (first[index]["req"]-first[index]["total"]).toString(), first[index]["section"]);
                                BlocProvider.of<CartCubit>(context).addItem(item);
                              },
                              ontab: () {
                                NavgatetoPage(context: context, page: DescribtionScreen(list:first[index]));
                              },
                              onlongpress: () async {
                                 await Share.share("تبرع عبر تطبيق احسينو");
                              }
                          ),
                          separatorBuilder: (context,index)=>const SizedBox(height: 10,),
                          itemCount: first.length
                      );}
    else{
      return Center(child: CircularProgressIndicator());
    }
  },
),
                  BlocBuilder<SectionsCubit, SectionsState>(
                    builder: (context, state) {
                      if(state is SectionsLoaded){
                        second = (state).second;
                        return ListView.separated(
                            itemBuilder: (context,index)=> defaultCardItem(
                                image: "Assets/images/SliderImages/muslims-reading-from-quran.jpg",
                                itemTitle: "${second[index]["title"]}",
                                leftnumber: (second[index]["req"]-second[index]["total"]).toString()+" د.ل ",
                                percent: 0.3,
                                percentvalue: (second[index]["total"]/second[index]["req"]*100).toStringAsFixed(2),
                                percentcolor: "#45C4B0",
                                function: (){
                                  DefaultPaymentBottomSheet(context);
                                },
                                function2: (){
                                  item['id']=second[index]["id"];
                                  item['title']=second[index]["title"];
                                  item['stay']=(second[index]["req"]-second[index]["total"]).toString();
                                  item['section']=second[index]["section"];
                                 // item=CartCase(second[index]["id"], second[index]["title"], (second[index]["req"]-second[index]["total"]).toString(), second[index]["section"]);
                                  BlocProvider.of<CartCubit>(context).addItem(item);
                                },
                                ontab: () {
                                  NavgatetoPage(context: context, page: DescribtionScreen(list:second[index]));
                                },
                                onlongpress: () async {
                                  await Share.share("تبرع عبر تطبيق احسينو");
                                }
                            ),
                            separatorBuilder: (context,index)=>const SizedBox(height: 10,),
                            itemCount: second.length
                        );}
                      else{
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                  BlocBuilder<SectionsCubit, SectionsState>(
                    builder: (context, state) {
                      if(state is SectionsLoaded){
                        last = (state).last;
                        return ListView.separated(
                            itemBuilder: (context,index)=> defaultCardItem(
                                image: "Assets/images/SliderImages/muslims-reading-from-quran.jpg",
                                itemTitle: "${last[index]["title"]}",
                                leftnumber: (last[index]["req"]-last[index]["total"]).toString()+" د.ل ",
                                percent: 0.3,
                                percentvalue: (last[index]["total"]/last[index]["req"]*100).toStringAsFixed(2),
                                percentcolor: "#45C4B0",
                                function: (){
                                  DefaultPaymentBottomSheet(context);
                                },
                                function2: (){
                                  item['id']=last[index]["id"];
                                  item['title']=last[index]["title"];
                                  item['stay']=(last[index]["req"]-last[index]["total"]).toString();
                                  item['section']=last[index]["section"];
                                  //item=CartCase(last[index]["id"], last[index]["title"], (last[index]["req"]-last[index]["total"]).toString(), last[index]["section"]);
                                  BlocProvider.of<CartCubit>(context).addItem(item);
                                },
                                ontab: () {
                                  NavgatetoPage(context: context, page: DescribtionScreen(list:last[index]));
                                },
                                onlongpress: () async {
                                  await Share.share("تبرع عبر تطبيق احسينو");
                                }
                            ),
                            separatorBuilder: (context,index)=>const SizedBox(height: 10,),
                            itemCount: last.length
                        );}
                      else{
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),

                ]),
              ),
            ],
          ),
        )
    );
  }
}
