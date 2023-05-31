import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'sections_state.dart';

class SectionsCubit extends Cubit<SectionsState> {
  SectionsCubit() : super(SectionsInitial());

  List<Map<String, dynamic>> first=[],second=[],last=[],inprogress=[],rejected=[];

  Future getInprogress() async{
    inprogress.clear();
    await FirebaseFirestore.instance.collection("cases").where("status",isEqualTo:"0").get().then((event) {
      for (var doc in event.docs) {
        inprogress.add(doc.data());
        print(" ${inprogress[0]}");
      }
      emit(CasesLoaded(inprogress,rejected));
    });
    return inprogress;
  }
  Future getRejected() async{
    rejected.clear();

    await FirebaseFirestore.instance.collection("cases").where("status",isEqualTo:"1").get().then((event) {
      for (var doc in event.docs) {
        rejected.add(doc.data());
        print(" ${rejected[0]}");
      }
      emit(CasesLoaded(inprogress,rejected));
    });
    return rejected;
  }
  Future getMaona() async{
    first.clear();
    Map<String, dynamic> data;
    await FirebaseFirestore.instance.collection("maona").orderBy('date', descending: true).get().then((event) {
      for (var doc in event.docs) {
        data = doc.data();
        data["id"]=doc.id;
        first.add(data);
        print(" ${data}");
      }
      emit(SectionsLoaded(first,second,last));
    });
    return first;
  }
  Future getProjects() async{
    second.clear();
    await FirebaseFirestore.instance.collection("projects").orderBy('date', descending: true).get().then((event) {
      for (var doc in event.docs) {
        second.add(doc.data());
        print(" ${second[0]}");
      }
      emit(SectionsLoaded(first,second,last));
    });
    return second;
  }
  Future getMadion() async{
    last.clear();
    await FirebaseFirestore.instance.collection("madion").orderBy('date', descending: true).get().then((event) {
      for (var doc in event.docs) {
        last.add(doc.data());
        print(" ${last[0]}");
      }
      emit(SectionsLoaded(first,second,last));
    });
    return last;
  }
  void getAll(){
    getMaona();
    getMadion();
    getProjects();
  }
}
