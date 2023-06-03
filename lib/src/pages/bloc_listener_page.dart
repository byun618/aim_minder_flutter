import 'package:aim_minder_flutter/src/bloc/sample_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocListenerPage extends StatefulWidget {
  const BlocListenerPage({super.key});

  @override
  State<BlocListenerPage> createState() => _BlocListenerPageState();
}

class _BlocListenerPageState extends State<BlocListenerPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SampleBloc(),
      child: SamplePage(),
    );
  }
}

class SamplePage extends StatelessWidget {
  // late SampleBloc _sampleBloc;

  SamplePage({super.key});

  void _showMessage(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext _) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: const Text('asdasd'),
            content: BlocBuilder<SampleBloc, int>(
                // bloc: _sampleBloc,
                bloc: context.read<SampleBloc>(),
                builder: (context, state) {
                  return Text(state.toString());
                }),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // _sampleBloc = context.read<SampleBloc>();

    return Scaffold(
      body: Center(
          // child: BlocListener<SampleBloc, int>(
          //   listenWhen: (previous, current) => current > 5,
          //   listener: (context, state) => {_showMessage(context)},
          //   child: Text(context.read<SampleBloc>().state.toString(),
          //       style: const TextStyle(fontSize: 70)),
          // ),

          // Builder를 이용해 showMessage 동작. 권장하지 않음
          // child: BlocBuilder<SampleBloc, int>(
          //     buildWhen: (previous, current) => current > 5,
          //     builder: (context, state) {
          //       if (state != 0) {
          //         WidgetsBinding.instance.addPostFrameCallback((_) {
          //           _showMessage(context);
          //         });
          //       }
          //       return Text(state.toString(),
          //           style: const TextStyle(fontSize: 70));
          //     })),

          child: BlocListener<SampleBloc, int>(
        listenWhen: (previous, current) => current > 5,
        listener: (context, state) => {_showMessage(context)},
        child: BlocBuilder<SampleBloc, int>(
          buildWhen: (previous, current) => current > 5,
          builder: (context, state) {
            return Text(
              state.toString(),
              style: const TextStyle(fontSize: 70),
            );
          },
        ),
      )),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<SampleBloc>().add(AddSampleEvent());
      }),
    );
  }
}
