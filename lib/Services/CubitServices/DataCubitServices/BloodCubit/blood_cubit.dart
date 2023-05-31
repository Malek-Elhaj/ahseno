import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';



part 'blood_state.dart';

class BloodCubit extends Cubit<BloodState> {

  List<Map<String, dynamic>> blood=[],lastBlood=[];

  BloodCubit() : super(BloodInitial());

  Future getAllBlood() async{
    blood.clear();
    await FirebaseFirestore.instance.collection("blood").orderBy('date', descending: true).get().then((event) {
      for (var doc in event.docs) {
        blood.add(doc.data());
        // print(" ${doc.data()}");
        print(" ${blood[0]}");
      }
      emit(BloodLooded(blood,lastBlood));
      // return _blood;
    });
    return blood;
  }
  Future getLastBlood()async{
    // .limit(limit)
    lastBlood.clear();
    await FirebaseFirestore.instance.collection("blood").orderBy('date', descending: true).limit(3).get().then((event) {
      for (var doc in event.docs) {
        lastBlood.add(doc.data());
        // print(" ${doc.data()}");
        print(" ${lastBlood[0]}");
      }
      emit(BloodLooded(blood,lastBlood));
      // return _blood;
    });
    return lastBlood;

  }
}
