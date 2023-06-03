import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class SampleBloc extends Bloc<SampleEvent, int> {
  SampleBloc() : super(0) {
    debugPrint('init SampleBloc');
    on<SampleEvent>((event, emit) {
      debugPrint('SampleBloc called');
    });
    on<AddSampleEvent>((event, emit) {
      emit(state + 1);
    });
  }
}

class SampleEvent {}

class AddSampleEvent extends SampleEvent {}
