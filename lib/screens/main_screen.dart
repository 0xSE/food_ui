import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ui/constants/constans.dart';
import 'package:food_ui/constants/json_data/dummy_data.dart';
import 'package:food_ui/widgets/shared_widgets.dart';


class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildTitle(
                text: "Explore",
                fontSize: 30,
              ),
              Container(
                width: double.infinity,
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: KDefaultPadding),
                decoration: BoxDecoration(
                    color: KWhite,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: KSecondaryColor)),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Find a food or restaurant",
                    prefixIcon: Icon(
                      Icons.search,
                      color: KSecondaryColor,
                    ),
                    suffixIcon: Icon(
                      Icons.add_road,
                      color: KSecondaryColor,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 110,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return BuildSectionCategories(
                      title: "Asian",
                      icon: Icons.food_bank_outlined,
                    );
                  },
                  itemCount: 10,
                ),
              ),
              BuildTitle(
                text: "Popular Food",
                fontSize: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: KDefaultPadding),
                height: 170,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: popularFood.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(KDefaultPadding / 2),
                      child: buildPopularItem(
                        title: popularFood[index].title,
                        img: popularFood[index].img,
                        price: popularFood[index].price,
                      ),
                    );
                  },
                ),
              ),
              BuildTitle(
                fontSize: 20,
                text: "Hot Offers",
              ),
              Container(
                height: 300,
                color: KWhite,
                child: ListView.builder(
                  shrinkWrap: false,
                  itemBuilder: (context, index) {
                    return buildHotOffersItem(
                      title: popularFood[index].title,
                      img: popularFood[index].img,
                      price: popularFood[index].price,
                      description: popularFood[index].description,
                    );
                  },
                  itemCount: popularFood.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class buildHotOffersItem extends StatelessWidget {
  final img;
  final title;
  final price;
  final description;

  const buildHotOffersItem(
      {Key? key, this.img, this.title, this.price, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(KDefaultPadding),
      child: Container(
        height: 80,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(img),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: KSecondaryColor),
                  ),
                  Container(
                    width: 200,
                    child: Text(
                      description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20,),
            Center(
              child: Text(
                price,
                style: TextStyle(
                    color: KSecondaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class buildPopularItem extends StatelessWidget {
  final img;
  final title;
  final price;

  const buildPopularItem({Key? key, this.img, this.title, this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: KWhite,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image.asset(
                img,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: buildTextProduct(
              text: title,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                buildTextProduct(
                  text: "4.2",
                ),
                Icon(
                  Icons.star,
                  color: KSecondaryColor,
                  size: 14,
                ),
                Icon(
                  Icons.star,
                  color: KSecondaryColor,
                  size: 14,
                ),
                Icon(
                  Icons.star,
                  color: KSecondaryColor,
                  size: 14,
                ),
                Icon(
                  Icons.star,
                  color: Colors.grey,
                  size: 14,
                ),
                buildTextProduct(
                  text: "(+12) ",
                ),
                buildTextProduct(
                  text: price,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class buildTextProduct extends StatelessWidget {
  final text;

  const buildTextProduct({Key? key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: KSecondaryColor, fontSize: 14),
    );
  }
}

class BuildSectionCategories extends StatelessWidget {
  final icon;
  final title;

  const BuildSectionCategories(
      {Key? key, @required this.icon, @required this.title})
      : super(key: key);

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(KDefaultPadding),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: KWhite,
            child: Icon(
              icon,
              color: KSecondaryColor,
              size: 40,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
              color: KSecondaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
