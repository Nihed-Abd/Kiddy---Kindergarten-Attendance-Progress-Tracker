import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'drawing_page_widget.dart' show DrawingPageWidget;
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class DrawingPageModel extends FlutterFlowModel<DrawingPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Signature widget.
  SignatureController? signatureController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    signatureController?.dispose();
  }
}
