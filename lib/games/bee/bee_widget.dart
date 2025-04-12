import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'bee_model.dart';
export 'bee_model.dart';

class BeeWidget extends StatefulWidget {
  const BeeWidget({
    super.key,
    required this.id,
  });

  final DocumentReference? id;

  @override
  State<BeeWidget> createState() => _BeeWidgetState();
}

class _BeeWidgetState extends State<BeeWidget> {
  late BeeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BeeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Lottie.asset(
          'assets/jsons/Animation_-_1718993585050.json',
          width: 252.0,
          height: 130.0,
          fit: BoxFit.cover,
          animate: true,
        ),
        Lottie.asset(
          'assets/jsons/Animation_-_1718993897743.json',
          width: 318.0,
          height: 130.0,
          fit: BoxFit.cover,
          animate: true,
        ),
        Flexible(
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
              child: StreamBuilder<EnfantRecord>(
                stream: EnfantRecord.getDocument(widget.id!),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }

                  final buttonEnfantRecord = snapshot.data!;

                  return FFButtonWidget(
                    onPressed: () async {
                      await RateRecord.createDoc(widget.id!)
                          .set(createRateRecordData(
                        rate: 10,
                        date: getCurrentTimestamp,
                      ));
                      if (buttonEnfantRecord.gender == Gender.BOY) {
                        context.pushNamed(
                          BoyWinnerWidget.routeName,
                          queryParameters: {
                            'id': serializeParam(
                              widget.id,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );
                      } else {
                        context.pushNamed(
                          GirlWinnerWidget.routeName,
                          queryParameters: {
                            'id': serializeParam(
                              widget.id,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );
                      }
                    },
                    text: 'Next',
                    options: FFButtonOptions(
                      width: 120.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFFFF6900),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter Tight',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
