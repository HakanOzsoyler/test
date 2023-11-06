import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:test/constants/app_constants.dart';

import '../../core/custom_icon.dart';

class CurrencyView extends StatefulWidget {
  const CurrencyView({super.key});

  @override
  State<CurrencyView> createState() => _CurrencyViewState();
}

class _CurrencyViewState extends State<CurrencyView> {
  String selectedCurrency = 'euro';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatinActionButton(),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: totalCard(),
          ),
          Expanded(
            flex: 3,
            child: currencyList(),
          ),
        ],
      ),
    );
  }

  Widget currencyList() {
    return ListView.builder(
      itemCount: AppConstants.currencyDataList.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            leading: Text(AppConstants.currencyDataList[index].bankName ?? ''),
            trailing: Text(
              AppConstants.currencyDataList[index].currency ?? '',
              style: const TextStyle(
                color: Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget totalCard() {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.blue,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
              ),
            ),
          ],
        ),
        Positioned(
          left: 20,
          right: 20,
          top: 50,
          child: Material(
            elevation: 20,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 100,
              height: 200,
              decoration:
                  BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Net Toplam',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      '18.598.456,88',
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget floatinActionButton() {
    return SpeedDial(
      spaceBetweenChildren: 5,
      children: [
        SpeedDialChild(
          onTap: () {
            setState(() {
              selectedCurrency = 'euro';
            });
          },
          backgroundColor: Colors.blue,
          child: const CustomIcon(currency: 'euro'),
        ),
        SpeedDialChild(
          onTap: () {
            setState(() {
              selectedCurrency = 'dollar';
            });
          },
          backgroundColor: Colors.blue,
          child: const CustomIcon(currency: 'dollar'),
        ),
        SpeedDialChild(
          onTap: () {
            setState(() {
              selectedCurrency = 'turkish';
            });
          },
          backgroundColor: Colors.blue,
          child: const CustomIcon(currency: 'turkish'),
        ),
      ],
      child: CustomIcon(
        currency: selectedCurrency,
      ),
    );
  }
}
