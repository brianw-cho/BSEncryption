import 'package:flutter/material.dart';
import 'package:bs_encryption/constants/color_constant.dart';

class StatementModel {
  String date;
  String downloaded;

  StatementModel(this.date, this.downloaded);
}

List<StatementModel> statements = statementData
    .map((item) => StatementModel(
    item['date'],
    item['downloaded']))
    .toList();

var statementData = [
  {
    "date": "20 Feb 2021",
    "downloaded": 'assets/icons/undownloaded-icon.png'
  },
  {
    "date": "20 Jan 2021",
    "downloaded": 'assets/icons/downloaded-logo.png'
  },

  {
    "date": "20 Dec 2020",
    "downloaded": 'assets/icons/undownloaded-icon.png'
  },
  {
    "date": "20 Nov 2020",
    "downloaded": 'assets/icons/undownloaded-icon.png'
  },
  {
    "date": "20 Oct 2020",
    "downloaded": 'assets/icons/downloaded-logo.png'
  },
  {
    "date": "20 Sep 2020",
    "downloaded": 'assets/icons/undownloaded-icon.png'
  },
  {
    "date": "20 Aug 2020",
    "downloaded": 'assets/icons/undownloaded-icon.png'
  },
  {
    "date": "20 Jul 2020",
    "downloaded": 'assets/icons/undownloaded-icon.png'
  },
  {
    "date": "20 Jun 2020",
    "downloaded": 'assets/icons/downloaded-logo.png'
  },
  {
    "date": "20 May 2020",
    "downloaded": 'assets/icons/downloaded-logo.png'
  },
  {
    "date": "20 Apr 2020",
    "downloaded": 'assets/icons/downloaded-logo.png'
  },
  {
    "date": "20 Mar 2020",
    "downloaded": 'assets/icons/undownloaded-icon.png'
  },
  {
    "date": "20 Feb 2020",
    "downloaded": 'assets/icons/downloaded-logo.png'
  },
  {
    "date": "20 Jan 2020",
    "downloaded": 'assets/icons/undownloaded-icon.png'
  },
  {
    "date": "20 Dec 2019",
    "downloaded": 'assets/icons/downloaded-logo.png'
  },
  {
    "date": "20 Nov 2019",
    "downloaded": 'assets/icons/undownloaded-icon.png'
  },
  {
    "date": "20 Oct 2019",
    "downloaded": 'assets/icons/downloaded-logo.png'
  },
  {
    "date": "20 Sep 2019",
    "downloaded": 'assets/icons/downloaded-logo.png'
  },
  {
    "date": "20 Aug 2019",
    "downloaded": 'assets/icons/undownloaded-icon.png'
  },
  {
    "date": "20 Jul 2020",
    "downloaded": 'assets/icons/downloaded-logo.png'
  },
];