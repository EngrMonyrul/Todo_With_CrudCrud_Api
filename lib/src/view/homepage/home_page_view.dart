import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/src/viewmodel/home_page_provider.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    final homePageProvider = Provider.of<HomePageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task View'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        hoverColor: Colors.green,
        splashColor: Colors.green,
        onPressed: () {
          homePageProvider.navigatorCreatePage();
        },
        child: const Icon(Icons.add, size: 30, color: Colors.black),
      ),
      body: Consumer<HomePageProvider>(builder: (context, property, child) {
        return ListView.builder(
          itemCount: property.todoList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                onTap: () {},
                tileColor: Colors.white,
                focusColor: Colors.green,
                hoverColor: Colors.green,
                splashColor: Colors.green,
                title: Text(property.todoList[index].todoTitle.toString()),
                titleTextStyle: const TextStyle(color: Colors.black),
                subtitle: Text(
                    property.todoList[index].todoDescription.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                subtitleTextStyle: const TextStyle(color: Colors.grey),
              ),
            );
          },
        );
      }),
    );
  }
}
