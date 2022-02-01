import 'package:bagzz/util/global_variables.dart';
import 'package:flutter/material.dart';

final GlobalVariables _gBloc = GlobalVariables();

class HomeScreenBloc {
  Positioned sliderArrows({
    required void Function()? arrowBackOnPress,
    required void Function()? arrowForwardOnPress,
  }) {
    return Positioned(
      bottom: 0,
      right: 10,
      child: Row(
        children: [
          Container(
            width: 51,
            height: 51,
            color: _gBloc.primaryColor,
            child: IconButton(
              onPressed: arrowBackOnPress,
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          const SizedBox(width: 1.5),
          Container(
            width: 51,
            height: 51,
            color: _gBloc.primaryColor,
            child: IconButton(
              onPressed: arrowForwardOnPress,
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Slider
  int sliderIndex = 0;
  List<Map<String, dynamic>> slider = [
    {"bgImage": "assets/images/slider_img1.png"},
    {"bgImage": "assets/images/slider_img2.png"},
  ];

  // bagzz shop items
  List<Map> shopBagzz = [
    {
      "bag": "assets/images/bag1.png",
      "itemName": "Artsy",
    },
    {
      "bag": "assets/images/bag2.png",
      "itemName": "Berkely",
    },
    {
      "bag": "assets/images/bag3.png",
      "itemName": "Capucinus",
    },
    {
      "bag": "assets/images/bag4.png",
      "itemName": "Monogram",
    },
  ];

  Container gridBagsList(
    int index, {
    required void Function() onPress,
    required void Function() iconPress,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: _gBloc.bgColor,
      ),
      child: Column(
        children: [
          SizedBox(
            width: 170,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  right: 9,
                  top: 6,
                  child: InkWell(
                    onTap: iconPress,
                    child: const Icon(
                      Icons.favorite_border,
                      size: 18,
                    ),
                  ),
                ),
                Image.asset(
                  shopBagzz[index]['bag'],
                  width: 111,
                  height: 111,
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Text(
            shopBagzz[index]['itemName'],
            style: const TextStyle(
              fontFamily: "playfair-display",
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 18),
          GestureDetector(
            onTap: onPress,
            child: Text(
              "Shop Now",
              style: TextStyle(
                color: _gBloc.primaryColor,
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: 88,
            height: 2,
            color: _gBloc.primaryColor,
          ),
        ],
      ),
    );
  }

  // Border Text Button
  Row borderTextButton({required String title, void Function()? onPress}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            onPress;
            print("Check all latest");
          },
          child: Container(
            height: 35,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.5,
              ),
            ),
            child: Text(
              title.toUpperCase(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Category List Grid
  List<Map> categoryList = [
    {
      "cat": "assets/images/cat1.png",
      "title": "Handle bags",
    },
    {
      "cat": "assets/images/cat2.png",
      "title": "Crossbody bags",
    },
    {
      "cat": "assets/images/cat3.png",
      "title": "Shoulder bags",
    },
    {
      "cat": "assets/images/cat4.png",
      "title": "Tote bag",
    },
  ];
SizedBox categoryGridList(Size size) {
    return SizedBox(
      width: size.width,
      height: 472,
      child: GridView.builder(
        itemCount: shopBagzz.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 13,
          mainAxisSpacing: 24,
          // childAspectRatio: 2,
          mainAxisExtent: 224,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Image.asset(
                categoryList[index]['cat'],
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                right: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: _gBloc.primaryColor,
                  ),
                  child: Text(
                    categoryList[index]['title'],
                    style: const TextStyle(
                      fontFamily: "playfair-display",
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
