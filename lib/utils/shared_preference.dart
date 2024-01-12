// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/model.dart';

class SharedPreferencesHelper {
  static SharedPreferences? prefs;

  static refresh() async {
    prefs = await SharedPreferences.getInstance();
    prefs!.reload();
  }

  static Future<List> getList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList('list');
    final List list = jsonList!.map((item) => jsonDecode(item)).toList();
    return list;
  }

  static Future addToCartData(List<GroceryItem> grocery) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //  final List<String> jsonList = grocery.map((item) => jsonEncode(item)).toList();
    // await prefs!.reload();
    return  prefs.setString('addToCart', jsonEncode(grocery));
  }


  static Future<List<GroceryItem>?> getAddToCartData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('addToCart');
    print('json decode is started');
    // print(data);
    if (data == null) {
      return null;
    }
    var result = json.decode(data).map((json) => GroceryItem.fromJson(json)).toList();
    //GroceryItem.fromJson(json.decode(data));
    print('final result is ${result.runtimeType}');

    List<GroceryItem> strings = List<GroceryItem>.from(result);
    //print("getcart ==> ${strings[0].name}");
    return strings;
  }

  static Future addTofavoriteData(List<GroceryItem> grocery) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString('addToFavorite', jsonEncode(grocery));
  }

  static Future<List<GroceryItem>?> getaddTofavoriteData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? data = prefs.getString('addToFavorite');
    print('json decode is started');
    print(data);
    if (data == null) {
      return null;
    }
    var result =
    json.decode(data).map((json) => GroceryItem.fromJson(json)).toList();
    //GroceryItem.fromJson(json.decode(data));
    print('final result is ${result.runtimeType}');
    List<GroceryItem> strings = List<GroceryItem>.from(result);
    return strings;
  }

  static Future remove(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  static Future removeFavourite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('addToFavorite');
  }

  static Future setPrice(price) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setDouble('price' , price);
  }

  static Future getPrice() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('price');
  }



// json.decode(data).map((json)=>GroceryItem.fromJson(json)).toList();
//   json.decode(response.body).map((json)=>Album.fromJson(json)).toList();
}
