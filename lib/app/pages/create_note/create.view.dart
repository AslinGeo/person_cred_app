import 'package:cred_app/app/constants/colors.dart';
import 'package:cred_app/app/constants/strings.dart';
import 'package:cred_app/app/data/modal/person.dart';
import 'package:cred_app/app/pages/create_note/create.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CreateView extends GetResponsiveView<CreateController> {
  Person? person;

  CreateView({super.key, this.person}) {
    controller.person = person;
    if (person != null) {
      controller.nameController.text = person!.name;
      controller.emailController.text = person!.email;
      controller.mobileController.text = person!.mobileNumber;
      controller.gender.value = person!.gender;
    }
    controller.init();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.primary,
          appBar: myAppBar(),
          body: body(),
        ),
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
                  InkWell(
                    onTap: () {
                      dialogBox(true);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: AppColors.darkGrey,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: AppColors.darkGrey,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                    child: Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 21,
                ),
                InkWell(
                  onTap: () async {
                    dialogBox(false);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: AppColors.darkGrey,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                      child: Icon(
                        Icons.save,
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

  body() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
              controller: controller.nameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  labelText: 'Email', border: OutlineInputBorder()),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                // You can add more email validation logic here
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
              controller: controller.mobileController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Mobile', border: OutlineInputBorder()),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your mobile number';
                }
                // You can add more mobile number validation logic here
                return null;
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Gender',
                style: TextStyle(color: Colors.white),
              ),
            ),
            DropdownButtonFormField<String>(
              value: controller.gender.value,
              items: ['Male', 'Female', 'Other']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                controller.gender.value = newValue!;
              },
              validator: (value) {
                if (value == null) {
                  return 'Please select your gender';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  dialogBox(bool isDelete) {
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
          icon: Icon(
            Icons.info,
            color: AppColors.darkGrey02,
          ),
          content: Text(
            isDelete ? AppStrings.deleteText : AppStrings.saveText,
            style: GoogleFonts.nunito(
                color: AppColors.lightGrey03,
                fontSize: 23,
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    controller.nameController.text = "";
                    controller.emailController.text = "";
                    controller.mobileController.text = "";

                    Get.back();
                    Get.back();
                  },
                  // ignore: sort_child_properties_last
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Text(AppStrings.discard,
                        style: const TextStyle(color: Colors.white)),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                TextButton(
                  onPressed: () async {
                    if (controller.formKey.currentState!.validate()) {
                      controller.updateOrCreatePerson();
                    } else {
                      Get.back();
                    }
                  },
                  // ignore: sort_child_properties_last
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Text(isDelete ? AppStrings.keep : AppStrings.save,
                        // ignore: prefer_const_constructors
                        style: TextStyle(color: Colors.white)),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
