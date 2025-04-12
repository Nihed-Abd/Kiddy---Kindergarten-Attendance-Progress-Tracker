import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'drawing2_model.dart';
export 'drawing2_model.dart';

class Drawing2Widget extends StatefulWidget {
  const Drawing2Widget({
    super.key,
    required this.id,
    required this.image,
  });

  final DocumentReference? id;
  final String? image;

  static String routeName = 'Drawing2';
  static String routePath = '/drawing2';

  @override
  State<Drawing2Widget> createState() => _Drawing2WidgetState();
}

class _Drawing2WidgetState extends State<Drawing2Widget> {
  late Drawing2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Drawing2Model());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.easeIn,
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).tertiary,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.network(
                          'https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExa3NxNmJpaTFsdW1lcGoyZGVybWw0cWJxbnU4c3JwMGozeGVqdmllZCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/BHNfhgU63qrks/giphy.webp',
                        ).image,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 6.0,
                          sigmaY: 6.0,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        32.0, 48.0, 32.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'Woow Nice Draw !',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineMedium
                                                  .override(
                                                    fontFamily: 'Inter Tight',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 391.0,
                                    height: 535.0,
                                    decoration: BoxDecoration(),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/image-removebg-preview_(10).png',
                                            width: double.infinity,
                                            height: 200.0,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.91),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              widget.image!,
                                              width: 400.0,
                                              height: 420.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: StreamBuilder<EnfantRecord>(
                                      stream:
                                          EnfantRecord.getDocument(widget.id!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }

                                        final buttonEnfantRecord =
                                            snapshot.data!;

                                        return FFButtonWidget(
                                          onPressed: () async {
                                            await RateRecord.createDoc(
                                                    widget.id!)
                                                .set(createRateRecordData(
                                              rate: 10,
                                              date: getCurrentTimestamp,
                                            ));
                                            if (buttonEnfantRecord.gender ==
                                                Gender.BOY) {
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
                                          icon: Icon(
                                            Icons.navigate_next_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            size: 35.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: 250.0,
                                            height: 50.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter Tight',
                                                      color: Colors.white,
                                                      fontSize: 25.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(14.0),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
