import 'package:dr_derm_frontend/models/feature_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<FeatureModel> features = [];

  void _getFeatures() {
    features = FeatureModel.getFeatures();
  }

  @override
  Widget build(BuildContext context) {
    _getFeatures();
    return Scaffold(
      backgroundColor: const Color(0xff0a0c16),
      appBar: appBar(),
      body: SizedBox(
        height: 440,
        child: ListView.separated(
          itemCount: features.length,
          separatorBuilder: (context, index) => const SizedBox(height: 25,),
          padding: const EdgeInsets.only(left: 30, right: 30,),
          itemBuilder: (context, index){
            return Container(
              height: 130,
              decoration: BoxDecoration(
                color: features[index].boxColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 125,
                    decoration: const BoxDecoration(
                      // color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: SvgPicture.asset(features[index].imageUrl,),
                    ),
                  ),
                  SizedBox(
                    width: 170,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                features[index].title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins-Medium',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const SizedBox(height: 8,),
                              Text(
                                features[index].description,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Quicksand-Medium',
                                  fontSize: 11,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            color: Color(0xff0a0c16),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomRight: Radius.circular(19),
                            ),
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/double-arrow-right.svg',
                            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }


  AppBar appBar(){
    return AppBar(
      title: const Text(
        'Welcome to Dr. Derm',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      toolbarHeight: 100,
      centerTitle: true,
      backgroundColor: const Color(0xff0a0c16),
      elevation: 0,
    );
  }

}