import 'package:flutter/material.dart';
import 'package:bs_encryption/constants/color_constant.dart';

class StatementModel {
  String date;
  bool downloaded;

  StatementModel(this.date, this.downloaded);
}

List<StatementModel> statements = statementData
    .map((item) => StatementModel(
    item['date'],
    item['downloaded']))
    .toList();

var statementData = [
  {
    "date": "20 Feb 2020",
    "downloaded": false
  },
  {
    "date": "19 Feb 2020",
    "downloaded": true
  },

  {
    "date": "18 Feb 2020",
    "downloaded": false
  },
  {
    "date": "17 Feb 2020",
    "downloaded": false
  },
  {
    "date": "16 Feb 2020",
    "downloaded": true
  },
  {
    "date": "15 Feb 2020",
    "downloaded": false
  },
  {
    "date": "14 Feb 2020",
    "downloaded": false
  },
  {
    "date": "13 Feb 2020",
    "downloaded": false
  },
  {
    "date": "12 Feb 2020",
    "downloaded": true
  },
  {
    "date": "11 Feb 2020",
    "downloaded": true
  },
  {
    "date": "10 Feb 2020",
    "downloaded": true
  },
  {
    "date": "9 Feb 2020",
    "downloaded": false
  },
  {
    "date": "8 Feb 2020",
    "downloaded": true
  },
  {
    "date": "7 Feb 2020",
    "downloaded": false
  },
  {
    "date": "6 Feb 2020",
    "downloaded": true
  },
  {
    "date": "5 Feb 2020",
    "downloaded": false
  },
  {
    "date": "4 Feb 2020",
    "downloaded": true
  },
  {
    "date": "3 Feb 2020",
    "downloaded": true
  },
  {
    "date": "2 Feb 2020",
    "downloaded": false
  },
  {
    "date": "1 Feb 2020",
    "downloaded": true
  },
];