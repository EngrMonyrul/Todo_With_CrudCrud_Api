import 'package:flutter/material.dart';
import 'package:untitled3/src/model/todo_model.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/src/viewmodel/home_page_provider.dart';

class DataModifyPageView extends StatefulWidget {
  const DataModifyPageView({super.key});

  @override
  State<DataModifyPageView> createState() => _DataModifyPageViewState();
}

class _DataModifyPageViewState extends State<DataModifyPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Data'),
      ),
      body: Consumer<HomePageProvider>(builder: (context, property, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              textField(
                height: MediaQuery.of(context).size.height * .08,
                width: MediaQuery.of(context).size.width,
                hintText: 'Add Title',
                textEditingController: property.titleController,
              ),
              const SizedBox(height: 20),
              textField(
                height: MediaQuery.of(context).size.height * .3,
                width: MediaQuery.of(context).size.width,
                hintText: 'Add Description',
                textEditingController: property.descriptionController,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: const ButtonStyle().copyWith(
                  backgroundColor: const MaterialStatePropertyAll(Colors.white),
                ),
                onPressed: () {
                  TodoModel model = TodoModel(
                      todoTitle: property.titleController.text,
                      todoDescription: property.descriptionController.text);

                  property.createTodo();
                },
                child: const Text('Add Item'),
              ),
            ],
          ),
        );
      }),
    );
  }

  Container textField({
    required dynamic height,
    required dynamic width,
    required String hintText,
    required TextEditingController textEditingController,
  }) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white54,
        border: Border.all(color: Colors.white),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
