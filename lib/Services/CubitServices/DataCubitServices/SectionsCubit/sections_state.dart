part of 'sections_cubit.dart';

@immutable
abstract class SectionsState {}

class SectionsInitial extends SectionsState {}

class SectionsLoaded extends SectionsState{
  List<Map<String, dynamic>> first,second,last;
  SectionsLoaded(this.first,this.second,this.last);
}
class CasesLoaded extends SectionsState{
  List<Map<String, dynamic>> inprogress,rejected;
  CasesLoaded(this.inprogress,this.rejected);
}