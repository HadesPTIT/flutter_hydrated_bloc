import 'package:flutter/material.dart';
import 'dart:convert';

///
/// Using [Dart Data Class Generator] for generate all of copyWith, fromJSON, toJSON...
/// https://marketplace.visualstudio.com/items?itemName=BendixMa.dart-data-class-generator
///
class CounterState {
  int value;
  CounterState({@required this.value});

  CounterState copyWith({int value}) {
    return CounterState(
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      value: map['value'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source));
}
