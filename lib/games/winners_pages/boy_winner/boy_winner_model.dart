import '/flutter_flow/flutter_flow_util.dart';
import '/games/rank_points_table/rank_points_table_widget.dart';
import '/index.dart';
import 'boy_winner_widget.dart' show BoyWinnerWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class BoyWinnerModel extends FlutterFlowModel<BoyWinnerWidget> {
  ///  State fields for stateful widgets in this page.

  AudioPlayer? soundPlayer;
  // Model for RankPointsTable component.
  late RankPointsTableModel rankPointsTableModel;

  @override
  void initState(BuildContext context) {
    rankPointsTableModel = createModel(context, () => RankPointsTableModel());
  }

  @override
  void dispose() {
    rankPointsTableModel.dispose();
  }
}
