import '/flutter_flow/flutter_flow_util.dart';
import '/games/rank_points_table/rank_points_table_widget.dart';
import '/index.dart';
import 'girl_winner_widget.dart' show GirlWinnerWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class GirlWinnerModel extends FlutterFlowModel<GirlWinnerWidget> {
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
