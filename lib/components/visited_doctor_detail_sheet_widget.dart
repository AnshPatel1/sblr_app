import '../backend/api_requests/api_calls.dart';
import '../components/quantity_adder_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VisitedDoctorDetailSheetWidget extends StatefulWidget {
  const VisitedDoctorDetailSheetWidget({
    Key key,
    this.currentDoctor,
  }) : super(key: key);

  final String currentDoctor;

  @override
  _VisitedDoctorDetailSheetWidgetState createState() =>
      _VisitedDoctorDetailSheetWidgetState();
}

class _VisitedDoctorDetailSheetWidgetState
    extends State<VisitedDoctorDetailSheetWidget> {
  String dropDownSampleValue;
  String pOPDropdownValue1;
  String pOPDropdownValue2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 40, 10, 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.93,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: Text(
                  'Dotor: ${widget.currentDoctor}',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: Text(
                    'Select samples distributed:',
                    style: FlutterFlowTheme.bodyText1,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                            child: FutureBuilder<ApiCallResponse>(
                              future: GetSamplesCall.call(),
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
                                final rowGetSamplesResponse = snapshot.data;
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FlutterFlowDropDown(
                                      options: GetSamplesCall.names(
                                        (rowGetSamplesResponse?.jsonBody ?? ''),
                                      )
                                          .map<String>((s) => s.toString())
                                          .toList()
                                          .toList(),
                                      onChanged: (val) => setState(
                                          () => dropDownSampleValue = val),
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height: 50,
                                      textStyle:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                      hintText: 'Please select...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Color(0xFF2143A0),
                                        size: 15,
                                      ),
                                      fillColor: Colors.white,
                                      elevation: 2,
                                      borderColor: Color(0xFF2143A0),
                                      borderWidth: 1,
                                      borderRadius: 25,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12, 4, 12, 4),
                                      hidesUnderline: true,
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 40,
                                      icon: Icon(
                                        Icons.add,
                                        color: Color(0xFF2143A0),
                                        size: 25,
                                      ),
                                      onPressed: () async {
                                        setState(() => FFAppState()
                                            .connectedDoctorSample
                                            .add(dropDownSampleValue));
                                      },
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                            child: Builder(
                              builder: (context) {
                                final samples = FFAppState()
                                        .connectedDoctorSample
                                        ?.toList() ??
                                    [];
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: samples.length,
                                  itemBuilder: (context, samplesIndex) {
                                    final samplesItem = samples[samplesIndex];
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 7, 0, 7),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              AutoSizeText(
                                                samplesItem.maybeHandleOverflow(
                                                    maxChars: 20),
                                                style:
                                                    FlutterFlowTheme.bodyText1,
                                              ),
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery.of(
                                                                context)
                                                            .viewInsets,
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.4,
                                                          child:
                                                              QuantityAdderWidget(
                                                            name: samplesItem,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                text: 'set qty',
                                                options: FFButtonOptions(
                                                  width: 80,
                                                  height: 40,
                                                  color: FlutterFlowTheme
                                                      .primaryColor,
                                                  textStyle: FlutterFlowTheme
                                                      .subtitle2
                                                      .override(
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
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                              child: Text(
                                'Select POPs distributed:',
                                style: FlutterFlowTheme.bodyText1,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                            child: FutureBuilder<ApiCallResponse>(
                              future: GetPOPsCall.call(),
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
                                final rowGetPOPsResponse = snapshot.data;
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FlutterFlowDropDown(
                                      options: GetPOPsCall.names(
                                        (rowGetPOPsResponse?.jsonBody ?? ''),
                                      )
                                          .map<String>((s) => s.toString())
                                          .toList()
                                          .toList(),
                                      onChanged: (val) => setState(
                                          () => pOPDropdownValue1 = val),
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height: 50,
                                      textStyle:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                      hintText: 'Please select...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Color(0xFF2143A0),
                                        size: 15,
                                      ),
                                      fillColor: Colors.white,
                                      elevation: 2,
                                      borderColor: Color(0xFF2143A0),
                                      borderWidth: 1,
                                      borderRadius: 25,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12, 4, 12, 4),
                                      hidesUnderline: true,
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 40,
                                      icon: Icon(
                                        Icons.add,
                                        color: Color(0xFF2143A0),
                                        size: 25,
                                      ),
                                      onPressed: () async {
                                        setState(() => FFAppState()
                                            .connectedDoctorPop
                                            .add(pOPDropdownValue1));
                                      },
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                            child: Builder(
                              builder: (context) {
                                final pops =
                                    FFAppState().connectedDoctorPop?.toList() ??
                                        [];
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: pops.length,
                                  itemBuilder: (context, popsIndex) {
                                    final popsItem = pops[popsIndex];
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 7, 0, 7),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              AutoSizeText(
                                                popsItem.maybeHandleOverflow(
                                                    maxChars: 20),
                                                style:
                                                    FlutterFlowTheme.bodyText1,
                                              ),
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery.of(
                                                                context)
                                                            .viewInsets,
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.4,
                                                          child:
                                                              QuantityAdderWidget(
                                                            name: popsItem,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                text: 'set qty',
                                                options: FFButtonOptions(
                                                  width: 80,
                                                  height: 40,
                                                  color: FlutterFlowTheme
                                                      .primaryColor,
                                                  textStyle: FlutterFlowTheme
                                                      .subtitle2
                                                      .override(
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
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                      child: Text(
                        'Select Products booked:',
                        style: FlutterFlowTheme.bodyText1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                    child: FutureBuilder<ApiCallResponse>(
                      future: GetProductsCall.call(),
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
                        final rowGetProductsResponse = snapshot.data;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlutterFlowDropDown(
                              options: GetProductsCall.names(
                                (rowGetProductsResponse?.jsonBody ?? ''),
                              )
                                  .map<String>((s) => s.toString())
                                  .toList()
                                  .toList(),
                              onChanged: (val) =>
                                  setState(() => pOPDropdownValue2 = val),
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 50,
                              textStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                              hintText: 'Please select...',
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xFF2143A0),
                                size: 15,
                              ),
                              fillColor: Colors.white,
                              elevation: 2,
                              borderColor: Color(0xFF2143A0),
                              borderWidth: 1,
                              borderRadius: 25,
                              margin:
                                  EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                              hidesUnderline: true,
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 40,
                              icon: Icon(
                                Icons.add,
                                color: Color(0xFF2143A0),
                                size: 25,
                              ),
                              onPressed: () async {
                                setState(() => FFAppState()
                                    .connectedDoctorBooking
                                    .add(pOPDropdownValue2));
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: Builder(
                      builder: (context) {
                        final booking =
                            FFAppState().connectedDoctorBooking?.toList() ?? [];
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: booking.length,
                          itemBuilder: (context, bookingIndex) {
                            final bookingItem = booking[bookingIndex];
                            return Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 7, 0, 7),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AutoSizeText(
                                        bookingItem.maybeHandleOverflow(
                                            maxChars: 20),
                                        style: FlutterFlowTheme.bodyText1,
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.4,
                                                  child: QuantityAdderWidget(
                                                    name: bookingItem,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        text: 'set qty',
                                        options: FFButtonOptions(
                                          width: 80,
                                          height: 40,
                                          color: FlutterFlowTheme.primaryColor,
                                          textStyle: FlutterFlowTheme.subtitle2
                                              .override(
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
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              FFButtonWidget(
                onPressed: () async {
                  await actions.finishDoctorDetail(
                    FFAppState().connectedDoctorSample.toList(),
                    FFAppState().selectedDoctors.toList(),
                    FFAppState().connectedDoctorPop.toList(),
                    FFAppState().selectedDoctors.toList(),
                    FFAppState().connectedDoctorSample.toList(),
                    FFAppState().selectedDoctors.toList(),
                  );
                  Navigator.pop(context);
                },
                text: 'Finish',
                icon: Icon(
                  Icons.check_circle,
                  size: 15,
                ),
                options: FFButtonOptions(
                  width: 150,
                  height: 40,
                  color: FlutterFlowTheme.secondaryColor,
                  textStyle: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
