import 'package:cred_app/app/constants/colors.dart';
import 'package:cred_app/app/constants/strings.dart';
import 'package:cred_app/app/data/modal/person.dart';
import 'package:cred_app/app/pages/create_note/create.controller.dart';
import 'package:cred_app/app/pages/create_note/create.view.dart';
import 'package:cred_app/app/pages/home/home.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends GetResponsiveView<HomeController> {
  HomeView({super.key}) {
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: SafeArea(
        child: Obx(() => Scaffold(
              backgroundColor: AppColors.primary,
              appBar: myAppBar(),
              body: controller.persons.isEmpty ? emptyBody() : body(),
              floatingActionButton: floatingActionButton(),
            )),
      ),
    );
  }

  myAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.notes,
                    style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 43,
                        fontWeight: FontWeight.w600),
                    // style: const TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 43,
                    //     fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    dialogBox();
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: AppColors.darkGrey,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                      child: Icon(
                        Icons.info_outline,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  emptyBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.emptyBody,
            style: GoogleFonts.nunito(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }

  floatingActionButton() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary
            .withOpacity(0.4), // Background color of the FloatingActionButton
        boxShadow: [
          BoxShadow(
            color: AppColors.primary
                .withOpacity(0.4), // Customize the shadow color here
            offset:
                const Offset(0, 3), // Change the shadow's position as needed
            blurRadius: 6, // Adjust the blur radius for the shadow
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primary,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary, // Color of the shadow
              offset: const Offset(4, 4), // Offset of the shadow
              blurRadius: 10, // Spread of the shadow
              spreadRadius: 10, // Optional, adds more spread if greater than 0
            ),
          ],
        ),
        child: FloatingActionButton(
          backgroundColor: AppColors.primary,
          onPressed: () {
            Get.put(CreateController());
            Get.to(CreateView());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  body() {
    return ListView.builder(
        itemCount: controller.persons.length,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              personTile(controller.persons[index]),
              const SizedBox(
                height: 10,
              )
            ],
          );
        }));
  }

  Widget personTile(Person data) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: InkWell(
        onTap: () {
          controller.viewNavigation(data);
        },
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.name,
                            style: GoogleFonts.nunito(
                                color: AppColors.blackDark,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          ),
                          IconButton(
                              onPressed: () {
                                controller.deletePerson(data);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.redAccent,
                              ))
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Email: ${data.email}',
                        style: GoogleFonts.nunito(
                            color: AppColors.blackDark,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Mobile: ${data.mobileNumber}',
                        style: GoogleFonts.nunito(
                            color: AppColors.blackDark,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Gender: ${data.gender}',
                        style: GoogleFonts.nunito(
                            color: AppColors.blackDark,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  dialogBox() {
    return showDialog(
      barrierColor: AppColors.lightGrey.withOpacity(0.2),
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20.0), // Adjust the radius as needed
          ),
          title: Text(
            AppStrings.madeBy,
            style: GoogleFonts.nunito(
                color: AppColors.lightGrey03,
                fontSize: 23,
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          content: Text(
            "Aslin Geo",
            style: GoogleFonts.nunito(
                color: AppColors.lightGrey03,
                fontSize: 20,
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
