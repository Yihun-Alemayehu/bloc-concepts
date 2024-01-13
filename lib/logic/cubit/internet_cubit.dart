// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

import 'package:bloc_concepts/presentation/constants/enum.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  InternetCubit({
    required this.connectivity,
    // required this.connectivityStreamSubscription,
  }) : super(InternetLoading()){
    monitorInternetConnection();
  }

  StreamSubscription<ConnectivityResult> monitorInternetConnection() {
    return connectivityStreamSubscription = 
    connectivity.onConnectivityChanged.listen((event) {
      if(event == ConnectivityResult.wifi){
        emitInternetConnected(ConnectionType.wifi);
      }else if(event == ConnectivityResult.mobile){
        emitInternetConnected(ConnectionType.Mobile);
      }else if(event == ConnectivityResult.none){
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(ConnectionType _connectionType) => emit(
        InternetConnected(connectionType: _connectionType),
      );

  void emitInternetDisconnected() => emit(
        InternetDisconnected(),
      );

  @override
  Future<void> close(){
    connectivityStreamSubscription.cancel();
    return super.close();
  }

}
