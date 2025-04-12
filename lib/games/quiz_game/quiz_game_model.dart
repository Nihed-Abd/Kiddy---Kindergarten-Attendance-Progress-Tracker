import '/flutter_flow/flutter_flow_util.dart';
import '/games/rank_points_table/rank_points_table_widget.dart';
import '/index.dart';
import 'quiz_game_widget.dart' show QuizGameWidget;
import 'package:flutter/material.dart';

class QuizGameModel extends FlutterFlowModel<QuizGameWidget> {
  ///  State fields for stateful widgets in this page.

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
