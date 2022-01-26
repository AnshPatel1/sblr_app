import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';
import 'package:sblr/custom_code/models/sblr_data.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  SharedPreferences prefs;

  List<String> connectedDoctors = [];

  String msoName = '';

  String msoID = '';

  List<String> selectedDoctors = [];

  List<String> connectedDoctorSample = [];

  List<String> connectedDoctorPop = [];

  List<Current_day_doctor> currentDayDoctors = [];
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
