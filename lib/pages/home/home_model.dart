import '/flutter_flow/flutter_flow_util.dart';
import '/pages/winner_avatar/winner_avatar_widget.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for WinnerAvatar component.
  late WinnerAvatarModel winnerAvatarModel1;
  // Model for WinnerAvatar component.
  late WinnerAvatarModel winnerAvatarModel2;
  // Model for WinnerAvatar component.
  late WinnerAvatarModel winnerAvatarModel3;

  @override
  void initState(BuildContext context) {
    winnerAvatarModel1 = createModel(context, () => WinnerAvatarModel());
    winnerAvatarModel2 = createModel(context, () => WinnerAvatarModel());
    winnerAvatarModel3 = createModel(context, () => WinnerAvatarModel());
  }

  @override
  void dispose() {
    winnerAvatarModel1.dispose();
    winnerAvatarModel2.dispose();
    winnerAvatarModel3.dispose();
  }
}
