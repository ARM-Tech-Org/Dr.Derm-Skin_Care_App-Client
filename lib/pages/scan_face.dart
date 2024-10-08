import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';


class ScanFacePage extends StatefulWidget {
  const ScanFacePage({super.key});

  @override
  State<ScanFacePage> createState() => _ScanFacePageState();
}

class _ScanFacePageState extends State<ScanFacePage> {
  File ? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      backgroundColor: const Color(0xff0a0c16),
      body: body(),
    );
  }

  Container body() {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      // color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 490,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xff2e3859),
            ),
            child: const Row(),
          ),
          Container(
            height: 20,
          ),
          InkWell(
            onTap: () {
              // Navigator.pop(context);
              // _pickImageFromGallery();
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xff2684fc),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Scan Face',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16,
                        color: Color(0xfffcfcfc),
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 70,
            // color: Colors.red,
            child: Row(
              children: [
                _selectedImage != null ? const Text('data')/*Image.file(_selectedImage!)*/ : const Text('Please select an Image text')
              ],
            ),

          ),
        ],
      ),
    );
  }

  AppBar appBar(context) {
    return AppBar(
      title: const Text(
        'Scan Face',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      toolbarHeight: 100,
      centerTitle: true,
      backgroundColor: const Color(0xff0a0c16),
      elevation: 0,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          margin: const EdgeInsets.only(left: 35),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
          ),
          child: SvgPicture.asset(
            'assets/icons/double-arrow-left.svg',
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }

  Future<void> _pickImageFromGallery() async {
    var uploadedImage = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      if (uploadedImage != null) {
        _selectedImage = File(uploadedImage.path);
      }
    });
  }
}

extension on ImagePicker {
  getImage({required ImageSource source}) {}
}