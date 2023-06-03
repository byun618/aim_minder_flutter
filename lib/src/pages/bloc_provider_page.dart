import 'package:aim_minder_flutter/src/bloc/sample_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class BlocProviderPage extends StatelessWidget {
  const BlocProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SampleBloc>(
      // 여기서 Bloc을 context에 Provide 해준다.
      create: (context) => SampleBloc(),
      lazy: false,
      child: const SamplePage2(),
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
      // BlocProvider로 부터 제공받은 Bloc을 사용할 수 있다.
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<SampleBloc>().add(AddSampleEvent());
      }),
    );
  }
}

class SamplePage2 extends StatelessWidget {
  const SamplePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: BlocBuilder<SampleBloc, int>(
        buildWhen: (previous, current) => current > 10,
        builder: (context, state) => Text(state.toString()),
      )),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<SampleBloc>().add(AddSampleEvent());
      }),
    );
  }
}
