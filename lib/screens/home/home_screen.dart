import 'package:bagzz/screens/home/home_screen_bloc.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenBloc _bloc = HomeScreenBloc();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            const SizedBox(height: 18),
            SizedBox(
              width: size.width,
              height: 215,
              child: Stack(
                children: [
                  SizedBox(
                    width: size.width,
                    height: 205,
                    child: Image.asset(
                      _bloc.slider[_bloc.sliderIndex]['bgImage'],
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Positioned(
                    top: 51,
                    right: 13,
                    child: Text(
                      "This \nseason’s \nlatest",
                      style: TextStyle(
                        fontFamily: "playfair-display",
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  _bloc.sliderArrows(
                    arrowBackOnPress: () {
                      setState(() {
                        _bloc.sliderIndex = 0;
                      });
                    },
                    arrowForwardOnPress: () {
                      setState(() {
                        _bloc.sliderIndex = 1;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: size.width,
              height: 464,
              margin: const EdgeInsets.only(top: 30, bottom: 37),
              child: GridView.builder(
                itemCount: _bloc.shopBagzz.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 13,
                  mainAxisSpacing: 24,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return _bloc.gridBagsList(
                    index,
                    onPress: () {},
                    iconPress: () {},
                  );
                },
              ),
            ),
            _bloc.borderTextButton(
              title: 'Check all latest',
              onPress: () {},
            ),
            const SizedBox(height: 48),
            const Text(
              'Shop by categories',
              style: TextStyle(
                fontFamily: 'playfair-display',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 24),
            _bloc.categoryGridList(size),
            const SizedBox(height: 44),
            _bloc.borderTextButton(
              title: 'Browse all categories',
              onPress: () {},
            ),
            const SizedBox(height: 44),
          ],
        ),
      ),
    );
  }
}
