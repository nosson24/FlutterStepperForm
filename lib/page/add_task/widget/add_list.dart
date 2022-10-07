import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/page/add_task/widget/text_box.dart';

int currentStep = 0;

final firstName = TextEditingController();
final lastName = TextEditingController();
final age = TextEditingController();
final phoneNumber = TextEditingController();
final email = TextEditingController();

List<Step> getSteps() => [
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: const Text('Account'),
        content: Column(
          children: [
            TextBoxWidget(
              headingText: const Text("First Name"),
              heightSize: 43,
              isWidget: TextField(
                controller: firstName,
                expands: true,
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            TextBoxWidget(
              headingText: const Text("Last name"),
              heightSize: 43,
              isWidget: TextField(
                controller: lastName,
                expands: true,
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            TextBoxWidget(
              headingText: const Text("Age"),
              heightSize: 43,
              isWidget: TextField(
                controller: age,
                expands: true,
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: const Text('Contact'),
        content: Column(
          children: [
            TextBoxWidget(
              headingText: const Text("Phone Number"),
              heightSize: 43,
              isWidget: TextField(
                controller: phoneNumber,
                expands: true,
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            TextBoxWidget(
              headingText: const Text("Email"),
              heightSize: 43,
              isWidget: TextField(
                controller: email,
                expands: true,
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
      Step(
        isActive: currentStep >= 2,
        title: const Text('Complete'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("first Name : ${firstName.text}"),
            Text("last Name : ${lastName.text}"),
            Text("Age : ${age.text}"),
            Text("Phone Number : ${phoneNumber.text}"),
            Text("Email : ${email.text}"),
          ],
        ),
      ),
    ];
