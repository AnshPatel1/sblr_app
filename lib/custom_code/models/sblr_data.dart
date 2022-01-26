import 'dart:convert';

import 'package:flutter/foundation.dart';

class SBLRPostDataCombined {
   int mso;
   String date;
   int total_booking_amount;
   Data data;
  SBLRPostDataCombined({
    this.mso,
    this.date,
    this.total_booking_amount,
    this.data,
  });

  SBLRPostDataCombined copyWith({
    int mso,
    String date,
    int total_booking_amount,
    Data data,
  }) {
    return SBLRPostDataCombined(
      mso: mso ?? this.mso,
      date: date ?? this.date,
      total_booking_amount: total_booking_amount ?? this.total_booking_amount,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'mso': mso,
      'date': date,
      'total_booking_amount': total_booking_amount,
      'data': data.toMap(),
    };
  }

  factory SBLRPostDataCombined.fromMap(Map<String, dynamic> map) {
    return SBLRPostDataCombined(
      mso: map['mso']?.toInt() ?? 0,
      date: map['date'] ?? '',
      total_booking_amount: map['total_booking_amount']?.toInt() ?? 0,
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SBLRPostDataCombined.fromJson(String source) => SBLRPostDataCombined.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SBLRPostDataCombined(mso: $mso, date: $date, total_booking_amount: $total_booking_amount, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SBLRPostDataCombined &&
      other.mso == mso &&
      other.date == date &&
      other.total_booking_amount == total_booking_amount &&
      other.data == data;
  }

  @override
  int get hashCode {
    return mso.hashCode ^
      date.hashCode ^
      total_booking_amount.hashCode ^
      data.hashCode;
  }
}

class Data {
   List<Current_day_doctor> current_day_doctors;
   List<Current_day_arc> current_day_arc;
   List<Current_day_chemist> current_day_chemists;
   List<Current_day_stockist> current_day_stockists;
  Data({
     this.current_day_doctors,
     this.current_day_arc,
     this.current_day_chemists,
     this.current_day_stockists,
  });

  Data copyWith({
    List<Current_day_doctor> current_day_doctors,
    List<Current_day_arc> current_day_arc,
    List<Current_day_chemist> current_day_chemists,
    List<Current_day_stockist> current_day_stockists,
  }) {
    return Data(
      current_day_doctors: current_day_doctors ?? this.current_day_doctors,
      current_day_arc: current_day_arc ?? this.current_day_arc,
      current_day_chemists: current_day_chemists ?? this.current_day_chemists,
      current_day_stockists: current_day_stockists ?? this.current_day_stockists,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'current_day_doctors': current_day_doctors.map((x) => x.toMap()).toList(),
      'current_day_arc': current_day_arc.map((x) => x.toMap()).toList(),
      'current_day_chemists': current_day_chemists.map((x) => x.toMap()).toList(),
      'current_day_stockists': current_day_stockists.map((x) => x.toMap()).toList(),
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      current_day_doctors: List<Current_day_doctor>.from(map['current_day_doctors']?.map((x) => Current_day_doctor.fromMap(x))),
      current_day_arc: List<Current_day_arc>.from(map['current_day_arc']?.map((x) => Current_day_arc.fromMap(x))),
      current_day_chemists: List<Current_day_chemist>.from(map['current_day_chemists']?.map((x) => Current_day_chemist.fromMap(x))),
      current_day_stockists: List<Current_day_stockist>.from(map['current_day_stockists']?.map((x) => Current_day_stockist.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(current_day_doctors: $current_day_doctors, current_day_arc: $current_day_arc, current_day_chemists: $current_day_chemists, current_day_stockists: $current_day_stockists)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Data &&
      listEquals(other.current_day_doctors, current_day_doctors) &&
      listEquals(other.current_day_arc, current_day_arc) &&
      listEquals(other.current_day_chemists, current_day_chemists) &&
      listEquals(other.current_day_stockists, current_day_stockists);
  }

  @override
  int get hashCode {
    return current_day_doctors.hashCode ^
      current_day_arc.hashCode ^
      current_day_chemists.hashCode ^
      current_day_stockists.hashCode;
  }
}

class Current_day_doctor {
   int doctor_id;
   List<dynamic> samples;
   List<dynamic> pop;
   List<dynamic> booking;
  Current_day_doctor({
     this.doctor_id,
     this.samples,
     this.pop,
     this.booking,
  });

  Current_day_doctor copyWith({
    int doctor_id,
    List<dynamic> samples,
    List<dynamic> pop,
    List<dynamic> booking,
  }) {
    return Current_day_doctor(
      doctor_id: doctor_id ?? this.doctor_id,
      samples: samples ?? this.samples,
      pop: pop ?? this.pop,
      booking: booking ?? this.booking,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'doctor_id': doctor_id,
      'samples': samples,
      'pop': pop,
      'booking': booking,
    };
  }

  factory Current_day_doctor.fromMap(Map<String, dynamic> map) {
    return Current_day_doctor(
      doctor_id: map['doctor_id']?.toInt() ?? 0,
      samples: List<dynamic>.from(map['samples']),
      pop: List<dynamic>.from(map['pop']),
      booking: List<dynamic>.from(map['booking']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Current_day_doctor.fromJson(String source) => Current_day_doctor.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Current_day_doctor(doctor_id: $doctor_id, samples: $samples, pop: $pop, booking: $booking)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Current_day_doctor &&
      other.doctor_id == doctor_id &&
      listEquals(other.samples, samples) &&
      listEquals(other.pop, pop) &&
      listEquals(other.booking, booking);
  }

  @override
  int get hashCode {
    return doctor_id.hashCode ^
      samples.hashCode ^
      pop.hashCode ^
      booking.hashCode;
  }
}

class Current_day_arc {
   int arc_id;
   List<dynamic> pop;
   List<dynamic> booking;
  Current_day_arc({
     this.arc_id,
     this.pop,
     this.booking,
  });

  Current_day_arc copyWith({
    int arc_id,
    List<dynamic> pop,
    List<dynamic> booking,
  }) {
    return Current_day_arc(
      arc_id: arc_id ?? this.arc_id,
      pop: pop ?? this.pop,
      booking: booking ?? this.booking,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'arc_id': arc_id,
      'pop': pop,
      'booking': booking,
    };
  }

  factory Current_day_arc.fromMap(Map<String, dynamic> map) {
    return Current_day_arc(
      arc_id: map['arc_id']?.toInt() ?? 0,
      pop: List<dynamic>.from(map['pop']),
      booking: List<dynamic>.from(map['booking']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Current_day_arc.fromJson(String source) => Current_day_arc.fromMap(json.decode(source));

  @override
  String toString() => 'Current_day_arc(arc_id: $arc_id, pop: $pop, booking: $booking)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Current_day_arc &&
      other.arc_id == arc_id &&
      listEquals(other.pop, pop) &&
      listEquals(other.booking, booking);
  }

  @override
  int get hashCode => arc_id.hashCode ^ pop.hashCode ^ booking.hashCode;
}

class Current_day_chemist {
   int chemist_id;
   List<dynamic> samples;
   List<dynamic> pop;
   List<dynamic> booking;
  Current_day_chemist({
     this.chemist_id,
     this.samples,
     this.pop,
     this.booking,
  });

  Current_day_chemist copyWith({
    int chemist_id,
    List<dynamic> samples,
    List<dynamic> pop,
    List<dynamic> booking,
  }) {
    return Current_day_chemist(
      chemist_id: chemist_id ?? this.chemist_id,
      samples: samples ?? this.samples,
      pop: pop ?? this.pop,
      booking: booking ?? this.booking,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chemist_id': chemist_id,
      'samples': samples,
      'pop': pop,
      'booking': booking,
    };
  }

  factory Current_day_chemist.fromMap(Map<String, dynamic> map) {
    return Current_day_chemist(
      chemist_id: map['chemist_id']?.toInt() ?? 0,
      samples: List<dynamic>.from(map['samples']),
      pop: List<dynamic>.from(map['pop']),
      booking: List<dynamic>.from(map['booking']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Current_day_chemist.fromJson(String source) => Current_day_chemist.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Current_day_chemist(chemist_id: $chemist_id, samples: $samples, pop: $pop, booking: $booking)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Current_day_chemist &&
      other.chemist_id == chemist_id &&
      listEquals(other.samples, samples) &&
      listEquals(other.pop, pop) &&
      listEquals(other.booking, booking);
  }

  @override
  int get hashCode {
    return chemist_id.hashCode ^
      samples.hashCode ^
      pop.hashCode ^
      booking.hashCode;
  }
}

class Current_day_stockist {
   int stockist_id;
   List<dynamic> booking;
  Current_day_stockist({
     this.stockist_id,
     this.booking,
  });

  Current_day_stockist copyWith({
    int stockist_id,
    List<dynamic> booking,
  }) {
    return Current_day_stockist(
      stockist_id: stockist_id ?? this.stockist_id,
      booking: booking ?? this.booking,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'stockist_id': stockist_id,
      'booking': booking,
    };
  }

  factory Current_day_stockist.fromMap(Map<String, dynamic> map) {
    return Current_day_stockist(
      stockist_id: map['stockist_id']?.toInt() ?? 0,
      booking: List<dynamic>.from(map['booking']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Current_day_stockist.fromJson(String source) => Current_day_stockist.fromMap(json.decode(source));

  @override
  String toString() => 'Current_day_stockist(stockist_id: $stockist_id, booking: $booking)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Current_day_stockist &&
      other.stockist_id == stockist_id &&
      listEquals(other.booking, booking);
  }

  @override
  int get hashCode => stockist_id.hashCode ^ booking.hashCode;
}