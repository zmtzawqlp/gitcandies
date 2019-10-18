import 'package:flutter/material.dart';
import 'package:gitav/utils/http_utils.dart';
import 'package:gitav/utils/route_util.dart';
import 'package:github/server.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

class BaseProvider extends ChangeNotifier with InputCheckMixin {
  static GitHub _gitHub;

  static HttpUtils _httpUtils = HttpUtils();

  RouteHelper get route => RouteHelper();

  T getProvider<T>() {
    return Provider.of<T>(route.navigatorKey.currentContext);
  }

  // ignore: unnecessary_getters_setters
  GitHub get github => _gitHub;

  // ignore: unnecessary_getters_setters
  set github(GitHub value) => _gitHub = value;

  HttpUtils get httpUtils => _httpUtils;
}

mixin InputCheckMixin {
  bool checkInputEmpty(String input, [String tip]) {
    if (input == null || input.trim().isEmpty) {
      if (tip != null) {
        showToast(tip);
      }
      return false;
    }
    return true;
  }

  String makeEmptyTip(String name) {
    return "The $name mustn't be null.";
  }
}
