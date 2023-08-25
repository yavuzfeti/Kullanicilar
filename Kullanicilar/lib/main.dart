import 'package:flutter/material.dart';
import 'package:kullanicilar/service/user_service.dart';
import 'model/user_model.dart';

void main() => runApp(app());

class app extends StatefulWidget {
  @override
  State<app> createState() => _appState();
}

class _appState extends State<app> {

  TextEditingController searchController = TextEditingController();
  bool isSearch = false;
  List<UsersModelData?> peopleList = [];
  List<UsersModelData?> searchList = [];

  @override
  void initState() {
    super.initState();
    _service.fetchUsers().then((value)
    {
      setState(() {
        if(value != null && value.data != null)
        {
          users = value.data!.cast<UsersModelData>();
          isLoading = true;
        }
        else
        {
          isLoading = true;
        }
      });
    });
  }

  UserService _service = UserService();
  bool? isLoading;
  List<UsersModelData> users = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Kullanıcılar"),
        ),
        body: isLoading == null ? const Center(
          child: CircularProgressIndicator(),
        )
            : isLoading == true ? ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
              return ListTile(
                title: Text("${users[index].firstName!+users[index].lastName!}"),
                subtitle: Text(users[index].email!),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(users[index].avatar!),
              ),
            );
          },
        ): const Center(child: Text("bir sorun oluştu"),)
      ),
    );
  }
}
