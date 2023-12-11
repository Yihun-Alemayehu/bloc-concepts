import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concepts/presentation/constants/enum.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;
  InternetCubit({
    required this.connectivity,
  }) : super(InternetLoading()) {
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectionType.wifi);
      } else if (connectivityResult == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectionType.data);
      }
    });
  }

  void emitInternetConnected(ConnectionType _connectionType) => emit(
        InternetConnected(connectionType: _connectionType),
      );

  void emitInternetDisconnected(ConnectionType _connectionType) => emit(
        InternetConnected(connectionType: _connectionType),
      );

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }

  StreamSubscription listen(Null Function(dynamic internetState) param0) {
  }
}
