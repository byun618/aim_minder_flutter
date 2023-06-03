import 'package:aim_minder_flutter/src/bloc/sample_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocBuilderPage extends StatefulWidget {
  const BlocBuilderPage({super.key});

  @override
  State<BlocBuilderPage> createState() => _BlocBuilderPageState();
}

class _BlocBuilderPageState extends State<BlocBuilderPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SampleBloc(), lazy: false, child: SamplePage());
  }
}

class SamplePage extends StatelessWidget {
  // bloc을 등록해야 사용이 가능한 케이스
  late SampleBloc _sampleBloc;

  void _showMessage(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext _) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text('Sample'),
            content: BlocBuilder<SampleBloc, int>(
                bloc: _sampleBloc,
                builder: (context, state) {
                  return Text(state.toString());
                }),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('확인'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    _sampleBloc = context.read<SampleBloc>();

    return Scaffold(
      body: Center(
        child: BlocBuilder<SampleBloc, int>(
          buildWhen: (previous, current) {
            return current > 10;
          },
          builder: (context, state) {
            return Text('index : $state', style: const TextStyle(fontSize: 20));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        // context.read<SampleBloc>().add(AddSampleEvent());
        _showMessage(context);
      }),
    );
  }
}
