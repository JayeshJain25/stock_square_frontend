import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'crypto_market_data_model.dart';

class CryptoMarketDataProvider with ChangeNotifier {
  CryptoMarketDataProvider();

  List<CryptoMarketDataModel> listModel = [];

  CryptoMarketDataProvider.fromJson(List<dynamic> parsedJson) {
    List<CryptoMarketDataModel> list = [];
    list = parsedJson
        .map((e) => CryptoMarketDataModel.fromJson(e as Map<String, dynamic>))
        .toList();
    listModel = list;
  }

  Future<void> cryptoMarketDataByPagination(int page) async {
    final url =
        "http://65.0.21.104/cryptocurrency/crypto-market-data/?page=$page";

    try {
      final response = await http.get(
        Uri.parse(url),
      );
      final r = json.decode(response.body) as List<dynamic>;
      final CryptoMarketDataProvider model =
          CryptoMarketDataProvider.fromJson(r);
      for (final element in model.listModel) {
        listModel.add(element);
      }
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
