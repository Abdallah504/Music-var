part of 'counting_cubit.dart';

@immutable
sealed class CountingState {}

final class CountingInitial extends CountingState {}

final class Increase extends CountingState{}
final class Decrease extends CountingState{}
