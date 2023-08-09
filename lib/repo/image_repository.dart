import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_exercise/models/image_model.dart';
import 'package:http/http.dart' as http;

class ImageRepository {
  Future<List<ImageModel>> getNetworkImages() async {
    try {
      var endpointUrl = Uri.parse('https://pixelford.com/api2/images');

      final response = await http.get(endpointUrl);

      if (response.statusCode == 200) {
        final List<dynamic> decodedList = jsonDecode(response.body) as List;

        final List<ImageModel> imageList = decodedList.map((listItem) {
          return ImageModel.fromJson(listItem);
        }).toList();

        debugPrint(imageList[0].urlFullSize);

        return imageList;
      } else {
        throw Exception('API not successful.');
      }
    } on SocketException {
      throw Exception('No internet connection');
    } on HttpException {
      throw Exception('Couldn\'t retrieve the images');
    } on FormatException {
      throw Exception('Bad response format');
    } catch (e) {
      debugPrint(e as String?);
      throw Exception('Unknown error');
    }
  }
}
