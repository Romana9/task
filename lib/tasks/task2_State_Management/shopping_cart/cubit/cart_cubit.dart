import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);

  List<Map> items = [
    {
      "title": "Shirt",
      "subTitle": "Men Regular Fit Solid Button Down Collar Formal Shirt",
      "price": 192,
      "image":
          "https://images.meesho.com/images/products/280402414/1qvxg_512.jpg"
    },
    {
      "title": "hoodie",
      "subTitle": "Egypation Coton",
      "price": 250,
      "image": "https://love-img.com/wp-content/uploads/2017/12/4266.jpg"
    },
    {
      "title": "Shirt",
      "subTitle": "Men Regular Fit Solid Button Down Collar Formal Shirt",
      "price": 192,
      "image":
          "https://images.meesho.com/images/products/280402414/1qvxg_512.jpg"
    },
    {
      "title": "hoodie",
      "subTitle": "Egypation Coton",
      "price": 250,
      "image": "https://love-img.com/wp-content/uploads/2017/12/4266.jpg"
    },
  ];
  List<Map> cart = [];

  void addCart({required Map value}) {
    cart.add(value);
    emit(AddSuccessfully());
  }

  void removeCart({required int index}) {
    cart.removeAt(index);
    emit(RemoveSuccessfully());
  }
}
