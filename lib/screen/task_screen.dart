import 'package:flutter/material.dart';
import 'package:todo_app_provider/constants/constants.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primary,
        appBar: AppBar(
          title: const Text(
            "To Do List",
            style: TextStyle(color: textWhite, fontWeight: FontWeight.w500),
          ),
          backgroundColor: secondary,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return const CustomDialog();
                });
          },
          child: Icon(
            Icons.add,
            color: textWhite,
            size: 30,
          ),
          backgroundColor: secondary,
        ),
        body: ListView.separated(
          itemBuilder: (context, index) {
            return TaskWidget();
          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: textBlue,
              thickness: 1,
            );
          },
          itemCount: 10,
        ));
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Dialog(
      backgroundColor: secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: sh * 0.6,
        width: sw * 0.8,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: sw * 0.05, vertical: sh * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "New Task",
                    style: TextStyle(
                        color: textWhite,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(height: sh * 0.02),
              const Text(
                "What do you want to do?",
                style: TextStyle(color: textBlue, fontSize: 18),
              ),
              const CustomTextField(
                hint: "Enter a task",
                icon: null,
              ),
              const SizedBox(height: 50),
              const Text(
                "Due Date",
                style: TextStyle(color: textBlue, fontSize: 18),
              ),
              CustomTextField(
                hint: "Select a Date",
                icon: Icons.calendar_today,
                readOnly: true,
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(DateTime.now().year + 1),
                  );
                
                },
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hint: "Select a Time",
                icon: Icons.access_time,
                readOnly: true,
                onTap: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                
                },
              ),
              const SizedBox(height: 50),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: textWhite,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  onPressed: (){}, child: const Text("Create task", style: TextStyle(color: secondary),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.onTap,
    this.readOnly = false,
  });
  final String hint;
  final IconData? icon;
  final void Function()? onTap; 
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly,
      style: const TextStyle(color: textWhite),
      decoration: InputDecoration(
        suffixIcon: InkWell(onTap:onTap,child: Icon(icon, color: textWhite,)),
        hintText: hint,
        hintStyle: const TextStyle(color: textBlue),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: textBlue),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: textWhite),
        ),
      ),
    );
  }
}

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 0),
      title: Text(
        "Task",
        style: TextStyle(
            color: textWhite, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        "Description",
        style: TextStyle(color: textBlue),
      ),
    );
  }
}
