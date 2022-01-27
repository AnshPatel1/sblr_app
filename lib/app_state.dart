import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

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
    _persistedExample = prefs.getStringList('ff_persistedExample') ?? [];
  }

  SharedPreferences prefs;

  List<String> connectedDoctors = [];

  String msoName = '';

  String msoID = '';

  List<String> selectedDoctors = [];

  List<String> connectedDoctorSample = [];

  List<String> connectedDoctorPop = [];

  List<String> connectedDoctorBooking = [];

  List<String> selectedChemists = [];

  List<String> selectedARCs = [];

  List<String> selectedChemistPOPs = [];

  List<String> selectedChemistBooking = [];

  List<String> selectedARCPOPs = [];

  List<String> selectedARCBooking = [];

  List<String> _persistedExample = [];
  List<String> get persistedExample => _persistedExample;
  set persistedExample(List<String> _value) {
    _persistedExample = _value;
    prefs.setStringList('ff_persistedExample', _value);
  }

  void addToPersistedExample(String _value) {
    _persistedExample.add(_value);
    prefs.setStringList('ff_persistedExample', _persistedExample);
  }

  void removeFromPersistedExample(String _value) {
    _persistedExample.remove(_value);
    prefs.setStringList('ff_persistedExample', _persistedExample);
  }
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
