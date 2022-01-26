import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../page2/page2_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class Page1Widget extends StatefulWidget {
  const Page1Widget({
    Key key,
    this.username,
    this.password,
    this.selectedDate,
    this.id,
  }) : super(key: key);

  final String username;
  final String password;
  final DateTime selectedDate;
  final String id;

  @override
  _Page1WidgetState createState() => _Page1WidgetState();
}

class _Page1WidgetState extends State<Page1Widget> {
  DateTime datePicked;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    DateTime _firstDate = new DateTime(
    DateTime.now().year, DateTime.now().month, DateTime.now().day - 3);
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
        final page1LoginAuthResponse = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Color(0xFF2DA17C),
            automaticallyImplyLeading: false,
            title: Text(
              'Page 1',
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
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Page2Widget(
                        username: widget.username,
                        password: widget.password,
                      ),
                    ),
                  );
                },
              ),
            ],
            centerTitle: true,
            elevation: 4,
          ),
          backgroundColor: Color(0xFFF5F5F5),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Page2Widget(
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
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 15, 0, 0),
                  child: Text(
                    getJsonField(
                      (page1LoginAuthResponse?.jsonBody ?? ''),
                      r'''$name''',
                    ).toString().maybeHandleOverflow(maxChars: 500),
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
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-0.9, 0),
                          child: Text(
                            'Pick the date:',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.bodyText1,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.05, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 25, 0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 50,
                                    fillColor: Color(0xFF0C4534),
                                    icon: Icon(
                                      Icons.date_range_outlined,
                                      color: Color(0xFFCDCDCD),
                                      size: 25,
                                    ),
                                    onPressed: () async {
                                      await DatePicker.showDatePicker(
                                        context,
                                        showTitleActions: true,
                                        onConfirm: (date) {
                                          setState(() => datePicked = date);
                                        },
                                        currentTime: getCurrentTimestamp,
                                        minTime: _firstDate,
                                        maxTime: getCurrentTimestamp,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 15, 15),
                                  child: AutoSizeText(
                                    dateTimeFormat('yMMMd', datePicked),
                                    style: FlutterFlowTheme.subtitle1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
