import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/controllers/article_controller.dart';

Drawer sideDrawer(NewsController newsController) {
  return Drawer(
    backgroundColor: lightGrey,
    child: ListView(
      children: <Widget>[
        GetBuilder<NewsController>(
          builder: (controller) {
            return Container(
              decoration: const BoxDecoration(
                  color: black,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
              padding: const EdgeInsets.symmetric(
                  horizontal: 18, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  controller.cName.isNotEmpty
                      ? Text(
                          "Country: ${controller.cName.value.toUpperCase()}",
                          style: const TextStyle(
                              color: white, 
                              fontSize: 18),
                        )
                      : const SizedBox.shrink(),
                  const SizedBox(height: 15.0),
                  controller.category.isNotEmpty
                      ? Text(
                          "Category: ${controller.category.value.capitalizeFirst}",
                          style: const TextStyle(
                              color: white, fontSize: 18),
                        )
                      : const SizedBox.shrink(),
                  const SizedBox(height: 15.0),
                  controller.channel.isNotEmpty
                      ? Text(
                          "Category: ${controller.channel.value.capitalizeFirst}",
                          style: const TextStyle(
                              color: white, fontSize: 18),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            );
          },
          init: NewsController(),
        ),

        ExpansionTile(
          collapsedTextColor: black,
          collapsedIconColor: black,
          iconColor: black,
          textColor: black,
          title: const Text("Select Country"),
          children: <Widget>[
            for (int i = 0; i < listOfCountry.length; i++)
            GestureDetector(
              child: ListTile(title: Text( listOfCountry[i]['name']!.toUpperCase())), 
              onTap: () {
                  newsController.country.value = listOfCountry[i]['code']!;
                  newsController.cName.value =
                      listOfCountry[i]['name']!.toUpperCase();
                  newsController.getAllNews();
                  newsController.getBreakingNews();
                },
            )
          ],
        ),

        /// For Selecting the Category
        ExpansionTile(
          collapsedTextColor: black,
          collapsedIconColor: black,
          iconColor: black,
          textColor: black,
          title: const Text("Select Category"),
          children: [
            for (int i = 0; i < listOfCategory.length; i++)
              GestureDetector(
                child: ListTile(title: Text(listOfCategory[i]['name']!.toUpperCase())),
                onTap: () {
                    newsController.category.value = listOfCategory[i]['code']!;
                    newsController.getAllNews();
                  },
              )
          ],
        ),

        /// For Selecting the Channel
        ExpansionTile(
          collapsedTextColor: black,
          collapsedIconColor: black,
          iconColor: black,
          textColor: black,
          title: const Text("Select Channel"),
          children: [
            for (int i = 0; i < listOfNewsChannel.length; i++)
              GestureDetector(
                child: ListTile(title: Text(listOfNewsChannel[i]['name']!.toUpperCase())),
                onTap: () {
                  newsController.channel.value = listOfNewsChannel[i]['code']!;
                  newsController.getAllNews(
                      channel: listOfNewsChannel[i]['code']);
                  newsController.cName.value = '';
                  newsController.category.value = '';
                  newsController.update();
                },
              ),
          ],
        ),
        const Divider(),
        ListTile(
            trailing: const Icon(
              Icons.done_sharp,
              size: 28,
              color: Colors.black,
            ),
            title: const Text(
              "Done",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            onTap: () => Get.back()),
      ],
    ),
  );
}