import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/DesignSystem/Components/Header/header_view.dart';
import 'package:flutter_marvel_app/DesignSystem/Components/HeroCard/hero_card_view.dart';

// margin: const EdgeInsets.only(top: 24),
//               padding: const EdgeInsets.only(left: 24),

class HomeScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: SafeArea(
            child: CustomHeader(
              onMenuPressed: () => {
                //
              },
              onSearchPressed: () => {
                //
              },
            )
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 24, top: 24),
          child: Stack(
            children: [
              Wrap(
                spacing: 8.0,
                direction: Axis.vertical,
                children: [
                  const Text(
                    "Bem-vindo ao Marvel Heroes",
                    style: TextStyle(
                      color: Color(0xFFB7B7C8),
                      fontSize: 14,
                    ),
                  ),
                  const Text(
                    "Escolha o seu\npersonagem",
                    style: TextStyle(
                      color: Color(0xFF313140),
                      fontSize: 32,
                      fontFamily: "Gilroy-Heavy"
                    ),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),

                  HeroCard(
                    heroName: "Spiderman",
                    imagePath: 'https://m.media-amazon.com/images/I/A10tF8xUYGL.jpg',
                    realName: 'Peter Parker',
                    onTap: () {  },
                  ),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
      );
  }
}