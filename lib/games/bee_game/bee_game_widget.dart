import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/games/bee/bee_widget.dart';
import 'package:flutter/material.dart';
import 'bee_game_model.dart';
export 'bee_game_model.dart';

class BeeGameWidget extends StatefulWidget {
  const BeeGameWidget({
    super.key,
    required this.id,
  });

  final DocumentReference? id;

  static String routeName = 'BeeGame';
  static String routePath = '/beeGame';

  @override
  State<BeeGameWidget> createState() => _BeeGameWidgetState();
}

class _BeeGameWidgetState extends State<BeeGameWidget> {
  late BeeGameModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BeeGameModel());
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: BeeWidget(
                        id: widget.id!,
                      ),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: Image.network(
                    'https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExZTNieHZheno5ZjZkbGN3MnRnbDZoeTdobnByZWVsa2t0OWdneXZ1NSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/kPoGh51vLKuypsfbmR/giphy.webp',
                  ).image,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
