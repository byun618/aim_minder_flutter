import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SampleSecondBloc extends Bloc<SampleSecondEvent, int> {
  SampleSecondBloc() : super(0) {
    debugPrint('init SampleSecondBloc');
    on<SampleSecondEvent>((event, emit) {
      debugPrint('Sample Second Event Called');
    });
  }
}

class SampleSecondEvent {}
