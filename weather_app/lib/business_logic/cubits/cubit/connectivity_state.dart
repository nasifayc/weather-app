part of 'connectivity_cubit.dart';

abstract class ConnectivityState {}

class ConnectivityLoading extends ConnectivityState {}

class ConnectivityConnected extends ConnectivityState {}

class ConnectivityDisconnected extends ConnectivityState {}
