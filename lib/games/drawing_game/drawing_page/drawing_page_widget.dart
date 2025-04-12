import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'drawing_page_model.dart';
export 'drawing_page_model.dart';

class DrawingPageWidget extends StatefulWidget {
  const DrawingPageWidget({
    super.key,
    required this.id,
  });

  final DocumentReference? id;

  static String routeName = 'DrawingPage';
  static String routePath = '/drawingPage';

  @override
  State<DrawingPageWidget> createState() => _DrawingPageWidgetState();
}

class _DrawingPageWidgetState extends State<DrawingPageWidget> {
  late DrawingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DrawingPageModel());
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
                            Column(
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
                                      Text(
                                        'Draw Something',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily: 'Inter Tight',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            32.0, 12.0, 32.0, 12.0),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 0.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 600.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                ),
                                              ),
                                              child: Stack(
                                                alignment: AlignmentDirectional(
                                                    1.0, -1.0),
                                                children: [
                                                  ClipRect(
                                                    child: Signature(
                                                      controller: _model
                                                              .signatureController ??=
                                                          SignatureController(
                                                        penStrokeWidth: 3.0,
                                                        penColor: Colors.black,
                                                        exportBackgroundColor:
                                                            Colors.white,
                                                      ),
                                                      backgroundColor:
                                                          Colors.white,
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                12.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 8.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      icon: Icon(
                                                        Icons.delete_rounded,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        size: 20.0,
                                                      ),
                                                      onPressed: () async {
                                                        safeSetState(() {
                                                          _model
                                                              .signatureController
                                                              ?.clear();
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.93),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  32.0,
                                                                  32.0,
                                                                  32.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          final signatureImage =
                                                              await _model
                                                                  .signatureController!
                                                                  .toPngBytes();
                                                          if (signatureImage ==
                                                              null) {
                                                            showUploadMessage(
                                                              context,
                                                              'Signature is empty.',
                                                            );
                                                            return;
                                                          }
                                                          showUploadMessage(
                                                            context,
                                                            'Uploading signature...',
                                                            showLoading: true,
                                                          );
                                                          final downloadUrl =
                                                              (await uploadData(
                                                                  getSignatureStoragePath(),
                                                                  signatureImage));

                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .hideCurrentSnackBar();
                                                          if (downloadUrl !=
                                                              null) {
                                                            safeSetState(() =>
                                                                _model.uploadedSignatureUrl =
                                                                    downloadUrl);
                                                            showUploadMessage(
                                                              context,
                                                              'Success!',
                                                            );
                                                          } else {
                                                            showUploadMessage(
                                                              context,
                                                              'Failed to upload signature.',
                                                            );
                                                            return;
                                                          }

                                                          context.pushNamed(
                                                            Drawing2Widget
                                                                .routeName,
                                                            queryParameters: {
                                                              'id':
                                                                  serializeParam(
                                                                widget.id,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                              'image':
                                                                  serializeParam(
                                                                _model
                                                                    .uploadedSignatureUrl,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        text: 'Next',
                                                        options:
                                                            FFButtonOptions(
                                                          width:
                                                              double.infinity,
                                                          height: 44.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter Tight',
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
