import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'incorrect_model.dart';
export 'incorrect_model.dart';

class IncorrectWidget extends StatefulWidget {
  const IncorrectWidget({super.key});

  @override
  State<IncorrectWidget> createState() => _IncorrectWidgetState();
}

class _IncorrectWidgetState extends State<IncorrectWidget> {
  late IncorrectModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IncorrectModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        Navigator.pop(context);
      },
      child: Lottie.asset(
        'assets/jsons/Animation_-_1719005667173.json',
        width: 301.0,
        height: 293.0,
        fit: BoxFit.cover,
        animate: true,
      ),
    );
  }
}
