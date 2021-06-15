import 'dart:convert';

import 'package:flutter/material.dart';

class ContactInfo  {
  String name;
  String tagIndex;
  String firstletter;

  ContactInfo({
    @required this.name,
    this.tagIndex,
    this.firstletter,
  });

  ContactInfo.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        firstletter = json['firstletter'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'firstletter': firstletter,
      };

  @override
  String getSuspensionTag() => tagIndex;

  @override
  String toString() => json.encode(this);
}
