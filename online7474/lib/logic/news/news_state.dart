part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}
final class Loading extends NewsState{}
final class DataReach extends NewsState{}
