part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class AddSuccessfully extends CartState {}
final class RemoveSuccessfully extends CartState {}
