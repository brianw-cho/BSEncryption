import 'package:flutter/material.dart';
import 'package:bs_encryption/constants/color_constant.dart';

class StatementModel {
  String date;
  String downloaded;
  bool isDownloaded;
  String pdfpath;
  String password;

  StatementModel(this.date, this.downloaded, this.isDownloaded, this.pdfpath, this.password);
}

List<StatementModel> statements = statementData
    .map((item) => StatementModel(
    item['date'],
    item['downloaded'],
    item['isDownloaded'],
    item['pdfpath'],
    item['password']))
    .toList();

var statementData = [
  {
    "date": "20 Feb 2021",
    "downloaded": 'assets/icons/undownloaded-icon.png',
    "isDownloaded": false,
    "pdfpath": "assets/encrypted_statements/statement0.pdf",
    "password": "T35HLvDq2EB4W8jS"
  },
  {
    "date": "20 Jan 2021",
    "downloaded": 'assets/icons/downloaded-logo.png',
    "isDownloaded": true,
    "pdfpath": "assets/encrypted_statements/statement1.pdf",
    "password": "vzVSKNx2mHJuWb9P"
  },

  {
    "date": "20 Dec 2020",
    "downloaded": 'assets/icons/undownloaded-icon.png',
    "isDownloaded": false,
    "pdfpath": "assets/encrypted_statements/statement2.pdf",
    "password": "JTsqx3WpZrt2VhHB"
  },
  {
    "date": "20 Nov 2020",
    "downloaded": 'assets/icons/undownloaded-icon.png',
    "isDownloaded": false,
    "pdfpath": "assets/encrypted_statements/statement3.pdf",
    "password": "f3sezGCWDMQuH984"
  },
  {
    "date": "20 Oct 2020",
    "downloaded": 'assets/icons/downloaded-logo.png',
    "isDownloaded": true,
    "pdfpath": "assets/encrypted_statements/statement4.pdf",
    "password": "uCqyWdQYjtp8V2Pe"
  },
  {
    "date": "20 Sep 2020",
    "downloaded": 'assets/icons/undownloaded-icon.png',
    "isDownloaded": false,
    "pdfpath": "assets/encrypted_statements/statement5.pdf",
    "password": "LEbyF8MUqAk2cPJ5"
  },
  {
    "date": "20 Aug 2020",
    "downloaded": 'assets/icons/undownloaded-icon.png',
    "isDownloaded": false,
    "pdfpath": "assets/encrypted_statements/statement6.pdf",
    "password": "x6XCThdb3SJ9rmDP"
  },
  {
    "date": "20 Jul 2020",
    "downloaded": 'assets/icons/undownloaded-icon.png',
    "isDownloaded": false,
    "pdfpath": "assets/encrypted_statements/statement7.pdf",
    "password": "pQ3cxWsktDfm2rMS"
  },
  {
    "date": "20 Jun 2020",
    "downloaded": 'assets/icons/downloaded-logo.png',
    "isDownloaded": true,
    "pdfpath": "assets/encrypted_statements/statement8.pdf",
    "password": "dLkbMPtS32aGycJg"
  },
  {
    "date": "20 May 2020",
    "downloaded": 'assets/icons/downloaded-logo.png',
    "isDownloaded": true,
    "pdfpath": "assets/encrypted_statements/statement9.pdf",
    "password": "UGwtKNxnRpg59L24"
  },
  {
    "date": "20 Apr 2020",
    "downloaded": 'assets/icons/downloaded-logo.png',
    "isDownloaded": true,
    "pdfpath": "assets/encrypted_statements/statement10.pdf",
    "password": "HadsL54EUJYv9Zrj"
  },
  {
    "date": "20 Mar 2020",
    "downloaded": 'assets/icons/undownloaded-icon.png',
    "isDownloaded": false,
    "pdfpath": "assets/encrypted_statements/statement11.pdf",
    "password": "af3h6FCPRHLWE27y"
  },
  {
    "date": "20 Feb 2020",
    "downloaded": 'assets/icons/downloaded-logo.png',
    "isDownloaded": true,
    "pdfpath": "assets/encrypted_statements/statement12.pdf",
    "password": "eJyrFzNMhEg2G4qD"
  },
  {
    "date": "20 Jan 2020",
    "downloaded": 'assets/icons/undownloaded-icon.png',
    "isDownloaded": false,
    "pdfpath": "assets/encrypted_statements/statement13.pdf",
    "password": "NAfX6KmGPn48MjJr"
  },
  {
    "date": "20 Dec 2019",
    "downloaded": 'assets/icons/downloaded-logo.png',
    "isDownloaded": true,
    "pdfpath": "assets/encrypted_statements/statement14.pdf",
    "password": "gfM3H8GP29BTFrJA"
  },
  {
    "date": "20 Nov 2019",
    "downloaded": 'assets/icons/undownloaded-icon.png',
    "isDownloaded": false,
    "pdfpath": "assets/encrypted_statements/statement15.pdf",
    "password": "PW7ayKFS4ZUwTxGs"
  },
  {
    "date": "20 Oct 2019",
    "downloaded": 'assets/icons/downloaded-logo.png',
    "isDownloaded": true,
    "pdfpath": "assets/encrypted_statements/statement16.pdf",
    "password": "RcjFgC5Q2PUbnz3M"
  },
  {
    "date": "20 Sep 2019",
    "downloaded": 'assets/icons/downloaded-logo.png',
    "isDownloaded": true,
    "pdfpath": "assets/encrypted_statements/statement17.pdf",
    "password": "ba3Mvr9VzE4XWCSU"
  },
  {
    "date": "20 Aug 2019",
    "downloaded": 'assets/icons/undownloaded-icon.png',
    "isDownloaded": false,
    "pdfpath": "assets/encrypted_statements/statement18.pdf",
    "password": "nkG54HYDu3QxAJbq"
  },
  {
    "date": "20 Jul 2020",
    "downloaded": 'assets/icons/downloaded-logo.png',
    "isDownloaded": true,
    "pdfpath": "assets/encrypted_statements/statement19.pdf",
    "password": "xDACb5zSm2KMndXH"
  },
];