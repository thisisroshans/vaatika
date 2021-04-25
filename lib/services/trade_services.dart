import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vrksh_vaatika/model/app_user.dart';
import 'package:vrksh_vaatika/model/trade_offers.dart';

import 'network_repository.dart';

class TradeServices {
  static Future<TradeOffers> getUserTradeOffers(BuildContext mContext) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    AppUser user = AppUser.fromJson(pref.getString('USER'));
    return callGetMethod(mContext, '/api/offer/useroffers', {}, user.token)
        .then((value) {
      return TradeOffers.fromJson(value);
    });
  }

  static Future<TradeOffers> editUserTradeOffers(
      BuildContext mContext, offerId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    AppUser user = AppUser.fromJson(pref.getString('USER'));
    return callPostMethodWithToken(
            mContext, '/api/offer/delete/$offerId}', {}, user.token)
        .then((value) {
      return TradeOffers.fromJson(value);
    });
  }

  static Future<TradeOffers> deleteUserTradeOffers(
      BuildContext mContext, offerId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    AppUser user = AppUser.fromJson(pref.getString('USER'));
    return callPostMethodWithToken(
            mContext, '/api/offer/delete/$offerId}', {}, user.token)
        .then((value) {
      return TradeOffers.fromJson(value);
    });
  }
}