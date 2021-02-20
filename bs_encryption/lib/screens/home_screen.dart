import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bs_encryption/constants/color_constant.dart';
import 'package:bs_encryption/models/card_model.dart';
import 'package:bs_encryption/models/transaction_model.dart';
import 'package:bs_encryption/screens/statement_screen.dart';
import 'package:bs_encryption/screens/pdfHandler.dart';
import 'package:local_auth/local_auth.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  List<int> get bytes => null;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
      child:AppBar(
        backgroundColor: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10)
          )
        ),
        leading: Padding(
          padding: EdgeInsets.only(top: 8),
          child: Tab(
            icon: Image(
              image: AssetImage('assets/images/bank-icon.png'),
              height: 40,
              width: 40,
            ),
        ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: EdgeInsets.only(right: 85, bottom: 4),
            child: Text(
                'Good evening, Brian!',
                style: GoogleFonts.nunito(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  color: Colors.white
                )
            ),
          ),
        ),
      ),
      ),


      body: Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Container(
              height: 185,
              child: ListView.builder(
                  padding: EdgeInsets.only(left:16, right: 8, top: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: cards.length,
                  itemBuilder: (context, index){
                    return Container(
                      margin: EdgeInsets.only(right:8),
                      height: 185,
                      width: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: cards[index].bgColor,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x10000000),
                            blurRadius:  10,
                            spreadRadius: 4,
                            offset: Offset(0.0, 8.0)
                          )
                        ]
                      ),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 16,
                            top: 12,
                            child: Image.asset(
                              cards[index].type,
                              height: 22,
                              width: 33,
                            ),
                          ),
                          Positioned(
                              top: 14,
                              right: 12,
                              child: Text(
                                  cards[index].name,
                                style: GoogleFonts.nunito(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: cards[index].firstColor
                                ),
                              )
                          ),
                          Positioned(
                              top: 63,
                              left: 16,
                              child: Text(
                                'Your Balance',
                                style: GoogleFonts.nunito(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: cards[index].secondColor
                                ),
                              )
                          ),
                          Positioned(
                            left: 16,
                              top: 81,
                              child: Text(
                                cards[index].balance,
                                style: GoogleFonts.nunito(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: cards[index].firstColor,
                                ),
                              )),
                          Positioned(
                              left: 16,
                              bottom: 30,
                              child: Text(
                                'Valid Thru',
                                style: GoogleFonts.nunito(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: cards[index].secondColor,
                                ),
                              )),
                          Positioned(
                              left: 16,
                              bottom: 12,
                              child: Text(
                                cards[index].valid,
                                style: GoogleFonts.nunito(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: cards[index].firstColor,
                                ),
                              )),
                          Positioned(
                              right: 8,
                              bottom: 8,
                              child: SvgPicture.asset(
                                cards[index].moreIcon,
                                height: 24,
                                width: 24,
                              )
                          )
                        ],
                      ),
                    );
                  },
              )
            ),

            Padding(
              padding: EdgeInsets.only(left: 24, top: 32, bottom: 16, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Last Transactions',
                    style: GoogleFonts.nunito(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: kWhiteColor
                    ),
                  ),
                  Text(
                    'See all transactions',
                    style: GoogleFonts.nunito(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: kWhiteColor
                    ),
                  ),
                ]
              )
            ),
            Container(
              height: 190,
              child: ListView.builder(
                padding: EdgeInsets.only(left:16, right: 8),
                scrollDirection: Axis.horizontal,
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 8),
                    height: 190,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: kBlackColor,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x04000000),
                          blurRadius: 10,
                          spreadRadius: 10,
                          offset: Offset(0.0, 8.0)
                        )
                      ]
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                            top: 16,
                            left: 16,
                            child: SvgPicture.asset(transactions[index].type),
                            height: 24,
                            width: 24,
                        ),
                        Positioned(
                            right: 16,
                            top: 16,
                            child: Text(
                              transactions[index].name,
                              style: GoogleFonts.nunito(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: transactions[index].colorType
                              ),
                            )
                        ),
                        Positioned(
                            top: 64,
                            left: 16,
                            child: Text(
                              transactions[index].signType +
                                transactions[index].amount,
                              style: GoogleFonts.nunito(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: transactions[index].colorType
                              ),
                            )
                        ),
                        Positioned(
                            top: 106,
                            left: 16,
                            child: Text(
                              transactions[index].information,
                              style: GoogleFonts.nunito(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: kWhiteColor
                              ),
                            )
                        ),
                        Positioned(
                            bottom: 48,
                            left: 16,
                            child: Text(
                              transactions[index].recipient,
                              style: GoogleFonts.nunito(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: kWhiteColor
                              ),
                            )
                        ),
                        Positioned(
                            bottom: 22,
                            left: 16,
                            child: Text(
                              transactions[index].date,
                              style: GoogleFonts.nunito(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: kWhiteColor
                              ),
                            )
                        ),
                        Positioned(
                            right: 14,
                            bottom: 16,
                            child: Image.asset(
                              transactions[index].card,
                              height: 22,
                              width: 33,
                            )
                        ),
                      ]
                    )
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24, top: 32, bottom: 16, right: 24),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states){
                          if (states.contains(MaterialState.pressed))
                            return kButtonPressedColor;
                          return kAccentColor;
                        }
                    )
                ),
                child: Text(
                  'View Statements',
                  style: GoogleFonts.nunito(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: kWhiteColor
                  ),
                ),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => pdfHandler())
                  );
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 24, top: 32, bottom: 16, right: 24),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states){
                        if (states.contains(MaterialState.pressed))
                          return kButtonPressedColor;
                        return kAccentColor;
                      }
                  )
                ),
                child: Text(
                  'View Statements',
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: kWhiteColor
                  ),
                ),
                  onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StatementScreen())
                  );
                  },
              ),
            )
          ]
        )
      )
    );
  }
}