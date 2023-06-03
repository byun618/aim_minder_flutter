import 'package:aim_minder_flutter/src/bloc/sample_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class BlocProviderPage extends StatelessWidget {
  const BlocProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SampleBloc>(
      create: (context) => SampleBloc(),
      lazy: false,
      child: const SamplePage(),
    );
  }
}

class SamplePage extends StatelessWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('SamplePage'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<SampleBloc>().add(AddSampleEvent());
      }),
    );
  }
}
