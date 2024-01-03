import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:untitled3/helper/data_api.dart';
import 'package:untitled3/helper/navigator.dart';
import 'package:untitled3/src/model/todo_model.dart';
import 'package:untitled3/src/view/homepage/home_page_view.dart';
import 'package:untitled3/src/view/homepage/subview/data_modify_view.dart';

class HomePageProvider extends ChangeNotifier {
  final NavigatorHelper navigatorHelper;

  HomePageProvider({required this.navigatorHelper}) {
    fetchAllData();
  }

  List<TodoModel> todoList = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  navigatorCreatePage() {
    navigatorHelper.pushNavigate(navigateState: const DataModifyPageView());
    notifyListeners();
  }

  navigateEditPage({required TodoModel model}) {
    titleController.text = model.todoTitle!;
    descriptionController.text = model.todoDescription!;
    navigatorHelper.pushNavigate(navigateState: const DataModifyPageView());
  }

  fetchAllData() async {
    navigatorHelper.showLoader();
    var resData = await DataApi().getAllData(url: '/todo');
    todoList = await resData
        .map<TodoModel>((item) => TodoModel.fromJson(item))
        .toList();
    // allTodos =
    //     resData.map<TodoModel>((item) => TodoModel.fromJson(item)).toList();
    // print(allTodos);
    print(todoList.toString());
    navigatorHelper.goBack();
    notifyListeners();
  }

  createTodo() async {
    navigatorHelper.showLoader();
    var resData = await DataApi().postDate(
      url: '/todo',
      data: {
        'title': titleController.text,
        'description': descriptionController.text
      },
    );
    if (resData) {
      fetchAllData();
      navigatorHelper.goBack();
      titleController.clear();
      descriptionController.clear();
      navigatorHelper.pushRemoveUntil(navigateState: const HomePageView());
    }
    notifyListeners();
  }

  editData({required int id}) async {
    navigatorHelper.showLoader();
    var resData = DataApi().putData(
      url: '/todo/$id',
      data: {
        'title': titleController.text,
        'description': descriptionController.text
      },
    );
    if (resData) {
      fetchAllData();
      navigatorHelper.goBack();
      titleController.clear();
      descriptionController.clear();
      navigatorHelper.pushRemoveUntil(navigateState: const HomePageView());
    }
    notifyListeners();
  }

  deleteTodo({required int id}) async {
    navigatorHelper.showLoader();
    var resData = await DataApi().deleteData(url: '/todo/$id');
    if (resData) {
      fetchAllData();
      navigatorHelper.goBack();
      titleController.clear();
      descriptionController.clear();
    }
    notifyListeners();
  }
}
