import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  ConnectivityCubit() : super(ConnectivityLoading()) {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
    _initialize();
  }

  Future<void> _initialize() async {
    final result = await _connectivity.checkConnectivity();
    _updateState(result);
  }

  void _updateState(List<ConnectivityResult> result) {
    if (result[0] == ConnectivityResult.none) {
      emit(ConnectivityDisconnected());
    } else {
      emit(ConnectivityConnected());
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
