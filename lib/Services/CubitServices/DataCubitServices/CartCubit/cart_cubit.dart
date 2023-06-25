import 'package:bloc/bloc.dart';
import 'package:designapp/Services/models/CartCaseModel/CartCase.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<Map<String, dynamic>> items=[];

  void addItem(Map<String, dynamic> item) {
    if (!items.contains(item)) {
      items.add(item);

    }
    emit(ItemAdded(items));
  }
  void removeItem(int index) {
    items.removeAt(index);
    emit(ItemAdded(items));
  }
}
