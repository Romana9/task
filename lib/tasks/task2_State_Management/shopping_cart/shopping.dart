import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cart_cubit.dart';

class ShoppingHome extends StatelessWidget {
  const ShoppingHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Shopping', style: TextStyle(fontSize: 24)),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Stack(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CartScreen()));
                          },
                          child: const Center(
                              child: Icon(Icons.add_shopping_cart, size: 30))),
                      Positioned(
                        top: 2,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Center(
                              child: Text(
                                CartCubit.get(context).cart.length.toString(),
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            body: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                itemCount: CartCubit.get(context).items.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Theme.of(context).primaryColor.withOpacity(0.3)),
                    clipBehavior: Clip.antiAlias,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Image.network(
                            CartCubit.get(context).items[index]["image"],
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    CartCubit.get(context).items[index]
                                        ["title"],
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    CartCubit.get(context).items[index]
                                        ["subTitle"],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    "${CartCubit.get(context).items[index]["price"]} EGP",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    onPressed: () {
                                      CartCubit.get(context).addCart(
                                          value: CartCubit.get(context)
                                              .items[index]);
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.brown),
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.all(12)),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8))),
                                    ),
                                    child: const Text(
                                      "Add To Cart",
                                      style: TextStyle(fontSize: 19),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  );
                }));
      },
    );
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Cart", style: TextStyle(fontSize: 24)),
          ),
          body: CartCubit.get(context).cart.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.not_interested,
                          size: 200, color: Colors.brown),
                      SizedBox(height: 16),
                      Text(
                        "Cart Is Empty",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Colors.brown),
                      )
                    ],
                  ),
                )
              : ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  itemCount: CartCubit.get(context).cart.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title:
                            Text(CartCubit.get(context).cart[index]["title"]),
                        subtitle: Text(
                          CartCubit.get(context).cart[index]["subTitle"],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            CartCubit.get(context).cart[index]["image"],
                          ),
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              CartCubit.get(context).removeCart(index: index);
                            },
                            icon: const Icon(Icons.remove_shopping_cart_sharp,
                                color: Colors.brown)),
                      ),
                    );
                  }),
        );
      },
    );
  }
}
