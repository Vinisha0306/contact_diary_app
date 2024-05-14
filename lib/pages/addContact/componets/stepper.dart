import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/headers.dart';

Widget stepper({required context, required contact}) {
  return Stepper(
    currentStep: Provider.of<StepperController>(context).CurrentStep,
    onStepContinue: () {
      Provider.of<StepperController>(context, listen: false).nextStep();
    },
    onStepCancel: () {
      Provider.of<StepperController>(context, listen: false).previousStep();
    },
    steps: [
      // name
      Step(
        title: const Text("Add Name"),
        isActive: Provider.of<StepperController>(context).isActive(index: 0),
        state: Provider.of<StepperController>(context).getStepState(index: 0),
        content: Form(
          key: ContactGlobal.form[0],
          child: TextFormField(
            onSaved: (val) {
              contact.name = val;
            },
            validator: (val) => (val!.isEmpty) ? "Enter your username" : null,
            decoration: const InputDecoration(
              hintText: "Enter Name",
              prefixIcon: Icon(
                CupertinoIcons.profile_circled,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ),
      // contact
      Step(
        title: const Text("Add Contact No."),
        isActive: Provider.of<StepperController>(context).isActive(index: 1),
        state: Provider.of<StepperController>(context).getStepState(index: 1),
        content: Form(
          key: ContactGlobal.form[1],
          child: TextFormField(
            onSaved: (val) {
              contact.contact = val;
            },
            validator: (val) => (val!.isEmpty)
                ? "Enter your Contact Number"
                : (val.length == 10)
                    ? null
                    : "Enter 10 Number",
            keyboardType: TextInputType.number,
            maxLength: 10,
            decoration: const InputDecoration(
              hintText: "Enter Contact No.",
              prefixIcon: Icon(
                CupertinoIcons.phone_circle,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ),
      // email
      Step(
        title: const Text("Add Email ID"),
        isActive: Provider.of<StepperController>(context).isActive(index: 2),
        state: Provider.of<StepperController>(context).getStepState(index: 2),
        content: Form(
          key: ContactGlobal.form[2],
          child: TextFormField(
            onSaved: (val) {
              contact.email = val;
            },
            validator: (val) => (val!.isEmpty) ? "Enter Contact Email" : null,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Enter Email ID",
              prefixIcon: Icon(
                CupertinoIcons.envelope_circle,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ),
      //image
      // Step(
      //   title: const Text("Add Image"),
      //   isActive: Provider.of<StepperController>(context).isActive(index: 3),
      //   state: Provider.of<StepperController>(context).getStepState(index: 3),
      //   content: Stack(
      //     children: [
      //       RepaintBoundary(
      //         key: ContactGlobal.form[3],
      //         child: CircleAvatar(
      //           radius: 80,
      //           foregroundImage: ContactGlobal.contactImage != null
      //               ? FileImage(ContactGlobal.contactImage!)
      //               : FileImage(
      //                   File(
      //                     'lib/assets/images/bg.jpg',
      //                   ),
      //                 ),
      //         ),
      //       ),
      //       Positioned(
      //         bottom: 0,
      //         right: 0,
      //         child: ElevatedButton(
      //           onPressed: () {
      //             Provider.of<StepperController>(context, listen: false)
      //                 .getImage(source: ImageSource.gallery);
      //             contact.image =
      //                 Provider.of<StepperController>(context, listen: false)
      //                     .getFileFromWidget();
      //           },
      //           style: const ButtonStyle(
      //             shape: MaterialStatePropertyAll(
      //               CircleBorder(),
      //             ),
      //           ),
      //           child: const Icon(Icons.add),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    ],
  );
}
