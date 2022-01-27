import '../backend/api_requests/api_calls.dart';
import '../components/visited_arc_detail_sheet_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../summary/summary_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Page4Widget extends StatefulWidget {
  const Page4Widget({
    Key key,
    this.username,
    this.password,
  }) : super(key: key);

  final String username;
  final String password;

  @override
  _Page4WidgetState createState() => _Page4WidgetState();
}

class _Page4WidgetState extends State<Page4Widget> {
  String dropDownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: LoginAuthCall.call(
        username: widget.username,
        passwd: widget.password,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.primaryColor,
              ),
            ),
          );
        }
        final page4LoginAuthResponse = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Color(0xFF2DA17C),
            automaticallyImplyLeading: true,
            title: Text(
              'Page 4',
              style: FlutterFlowTheme.title2.override(
                fontFamily: 'Poppins',
                color: Color(0xFFDCDCDC),
              ),
            ),
            actions: [
              FlutterFlowIconButton(
                borderColor: Color(0x00C2C2C2),
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                fillColor: Color(0x00ABABAB),
                icon: Icon(
                  Icons.chevron_right,
                  color: Color(0xFFCFCFCF),
                  size: 30,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
            ],
            centerTitle: true,
            elevation: 4,
          ),
          backgroundColor: Color(0xFFF5F5F5),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              await actions.logArc();
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SummaryWidget(
                    username: widget.username,
                    password: widget.password,
                  ),
                ),
              );
            },
            backgroundColor: Color(0xFF13372C),
            icon: Icon(
              Icons.navigate_next_rounded,
            ),
            elevation: 8,
            label: Container(),
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 15, 0, 0),
                      child: Text(
                        'Add ARCs visited (if any):',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0x00EEEEEE),
                        ),
                        child: FutureBuilder<ApiCallResponse>(
                          future: GetARCsCall.call(
                            id: getJsonField(
                              (page4LoginAuthResponse?.jsonBody ?? ''),
                              r'''$pk''',
                            ).toString(),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.primaryColor,
                                  ),
                                ),
                              );
                            }
                            final rowGetARCsResponse = snapshot.data;
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: FutureBuilder<ApiCallResponse>(
                                      future: GetDoctorsCall.call(
                                        id: getJsonField(
                                          (page4LoginAuthResponse?.jsonBody ??
                                              ''),
                                          r'''$pk''',
                                        ).toString(),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                color: FlutterFlowTheme
                                                    .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        final dropDownGetDoctorsResponse =
                                            snapshot.data;
                                        return FlutterFlowDropDown(
                                          options: GetARCsCall.arcs(
                                            (rowGetARCsResponse?.jsonBody ??
                                                ''),
                                          )
                                              .map<String>((s) => s.toString())
                                              .toList()
                                              .toList(),
                                          onChanged: (val) => setState(
                                              () => dropDownValue = val),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          height: 50,
                                          textStyle: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.black,
                                          ),
                                          hintText: 'Please select...',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down,
                                            size: 15,
                                          ),
                                          fillColor: Colors.white,
                                          elevation: 2,
                                          borderColor: Color(0xFF0C4534),
                                          borderWidth: 1,
                                          borderRadius: 25,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 4, 12, 4),
                                          hidesUnderline: true,
                                        );
                                      },
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 60,
                                    icon: Icon(
                                      Icons.add_rounded,
                                      color: Color(0xFF13372C),
                                      size: 35,
                                    ),
                                    onPressed: () async {
                                      setState(() => FFAppState()
                                          .selectedARCs
                                          .add(dropDownValue));
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Text(
                      'Visited chemists:',
                      style: FlutterFlowTheme.bodyText1,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  decoration: BoxDecoration(
                    color: Color(0x00EEEEEE),
                  ),
                  child: Builder(
                    builder: (context) {
                      final selectedArc =
                          FFAppState().selectedARCs?.toList() ?? [];
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: selectedArc.length,
                        itemBuilder: (context, selectedArcIndex) {
                          final selectedArcItem = selectedArc[selectedArcIndex];
                          return Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFF10072F),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AutoSizeText(
                                    selectedArcItem,
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFEAEAEA),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 50,
                                          icon: Icon(
                                            Icons.delete_forever,
                                            color: Color(0xFFE75E5E),
                                            size: 25,
                                          ),
                                          onPressed: () async {
                                            setState(() => FFAppState()
                                                .selectedARCs
                                                .remove(selectedArcItem));
                                          },
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 60,
                                          icon: Icon(
                                            Icons.chevron_right_sharp,
                                            color: Color(0xFF2143A0),
                                            size: 30,
                                          ),
                                          onPressed: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.of(context)
                                                          .viewInsets,
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.8,
                                                    child:
                                                        VisitedArcDetailSheetWidget(
                                                      currentARC:
                                                          selectedArcItem,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 30, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Warning!'),
                              content: Text(
                                  'You must not delete any entries on this page. To make changes click cancel and make changes. To confirm, click \'confirm\''),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    Navigator.pop(alertDialogContext);
                                    await actions.commitDoctors();
                                    ;
                                  },
                                  child: Text('Confirm'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      text: 'confirm',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: Color(0xFF4E77D8),
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
