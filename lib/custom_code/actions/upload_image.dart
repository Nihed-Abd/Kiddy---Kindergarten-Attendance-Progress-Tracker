// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http; // Ensure http package is imported
import 'dart:convert';

Future<String?> uploadImage(
  BuildContext context,
  FFUploadedFile? picture,
) async {
  // Add your function code here!
  final String cloudName = 'dockqbc5i'; // Replace with your actual cloud name
  final String apiKey = '329791328233327'; // Your API Key
  final String uploadPreset =
      'lq4gcwkj'; // Your Cloudinary unsigned upload preset

  // Check if picture is null
  if (picture == null) {
    return null;
  }

  try {
    // Convert the image bytes to base64
    String base64Image = base64Encode(picture.bytes!);

    // Prepare the Cloudinary URL
    final String uploadUrl =
        'https://api.cloudinary.com/v1_1/$cloudName/image/upload';

    // Send the HTTP request
    final request = http.MultipartRequest('POST', Uri.parse(uploadUrl));
    request.fields['file'] =
        'data:image/jpeg;base64,$base64Image'; // The file data in base64
    request.fields['upload_preset'] =
        uploadPreset; // Upload preset defined in Cloudinary
    request.fields['api_key'] = apiKey;

    final response = await request.send();
    final responseString = await response.stream.bytesToString();

    // Log the response for debugging
    print('Response from Cloudinary: $responseString');

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(responseString);
      return jsonResponse['secure_url']; // Return the URL of the uploaded image
    } else {
      // Log the error response in case of failure
      print('Failed to upload image: ${response.statusCode}');
      print('Error response: $responseString');
      return null;
    }
  } catch (error) {
    // Catch any errors and log them
    print('Error during image upload: $error');
    return null;
  }
}
