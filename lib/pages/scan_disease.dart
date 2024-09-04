import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class ScanDiseasePage extends StatefulWidget {
  const ScanDiseasePage({super.key});

  @override
  State<ScanDiseasePage> createState() => _ScanDiseasePageState();
}

class _ScanDiseasePageState extends State<ScanDiseasePage> {
  File? _selectedImage;
  final picker = ImagePicker();

  Future _pickImageFromGallery() async {
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    setState(() {
      if (pickedImage != null) {
        _selectedImage = File(pickedImage.path);
        // widget.imgUrl = null;
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState(){
    super.initState();

    _pickImageFromGallery();
  }

  @override
  Widget build(BuildContext context) {
    // _pickImageFromGallery();

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
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: _selectedImage != null
                ? const Color(0xff2e2e2e)
                : const Color(0xff2e3859),
              /*border: Border.all(
                color: Colors.white,
                width: 2,
              ),*/
            ),
            child: _selectedImage != null
                ? Image.file(
                    _selectedImage!.absolute,
                    fit: BoxFit.contain,
                  )
                : const Center(
                    child: Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
          ),
          Container(
            height: 20,
          ),
          InkWell(
            onTap: () {
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
                    'Scan Disease',
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
        ],
      ),
    );
  }

  AppBar appBar(context) {
    return AppBar(
      title: const Text(
        'Scan Disease',
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
}

/*
extension on ImagePicker {
  getImage({required ImageSource source}) {}
}*/