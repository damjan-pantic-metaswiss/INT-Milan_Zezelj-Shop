import 'package:flutter/material.dart';
import 'package:tech_byte/models/product_model.dart';
import 'package:tech_byte/utils/colors.dart';
import 'package:tech_byte/utils/constants.dart';
import 'package:tech_byte/widgets/alert_dialog_widget.dart';
import 'package:tech_byte/widgets/app_bar_widget.dart';
import 'package:tech_byte/widgets/button_widget.dart';
import 'package:tech_byte/widgets/detail_overview_card_widget.dart';
import 'package:tech_byte/widgets/rating_widget.dart';
import 'package:tech_byte/widgets/section_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TBColor.app.backgroundColor,
      appBar: TBAppBar(
        title: RichText(
          text: TextSpan(
            style: TextStyle(
                fontSize: TBDimensions.appBar.specialTitleFontSize,
                color: Colors.black),
            children: const [
              TextSpan(text: "Tech"),
              TextSpan(
                  text: "Byte", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit,
              color: TBColor.appBar.blueGradientColor,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: TBDimensions.app.screenMarginSize,
        ),
        child: SafeArea(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TBSection(
                  title: "Details",
                  content: TBDetailOverviewCard(
                    name: product.name,
                    company: product.company,
                    description: product.description,
                    discount: product.discount,
                    price: product.price,
                    rating: product.rating,
                  )),
              const TBRating(rating: 5),
              TBButton(
                type: TBButtonType.filled,
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => const HomeScreen()));
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => TBAlertDialog.error(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            message:
                                "Something went wrong while editing product!",
                          ));
                },
                text: "Add Product",
              ),
            ],
          )),
        ),
      ),
    );
  }
}
