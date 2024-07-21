part of 'add_note_cubit_cubit.dart';

@immutable
abstract class AddNoteCubitState {}

final class AddNoteCubitInitial extends AddNoteCubitState {}
final class AddNoteCubitLoading extends AddNoteCubitState {}
final class AddNoteCubitSuccess extends AddNoteCubitState {}
final class AddNoteCubitError extends AddNoteCubitState {
  final String error;
  AddNoteCubitError({required this.error});
}
