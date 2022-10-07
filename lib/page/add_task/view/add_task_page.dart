import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/model/todo_model.dart';
import 'package:flutter_to_do_list/page/add_task/widget/add_list.dart';
import 'package:flutter_to_do_list/page/home/view/show_list_page.dart';
import 'package:flutter_to_do_list/service/todo_list_service.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
      ),
      body: Stepper(
        steps: getSteps(),
        // type: StepperType.horizontal,
        currentStep: currentStep,
        onStepContinue: () {
          final isLastStep = currentStep == getSteps().length - 1;
          if (isLastStep) {
            ToDoListService.saveToDo(ToDoModel(
              firstName.text,
              lastName.text,
              age.text,
              phoneNumber.text,
              email.text,
            ));
            Navigator.pushAndRemoveUntil<void>(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const ShowListPage()),
              (route) => false,
            );
            setState(() {
              currentStep = 0;

              firstName.clear();
              lastName.clear();
              age.clear();
              phoneNumber.clear();
              email.clear();
            });

            print('Completed');
          } else {
            setState(() => currentStep += 1);
          }
        },
        onStepCancel:
            currentStep == 0 ? null : () => setState(() => currentStep -= 1),
        controlsBuilder: (context, details, {onStepContinue, onStepCancel}) {
          final isListStep = currentStep == getSteps().length - 1;
          return Container(
            margin: const EdgeInsets.only(top: 50),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: details.onStepContinue,
                    child: Text(isListStep ? 'CONFIRM' : 'NEXT'),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                if (currentStep != 0)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: details.onStepCancel,
                      child: const Text("BACK"),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
