import 'package:api_animals/provider/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODOS"),
      ),
   //FutureBuilder
      body: FutureBuilder(
          future: context.read<TodoProvider>().getTodos(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            //Consumer because of provider
            return Consumer<TodoProvider>(
                builder: (context, todoProvider, child) {
              return ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Row(
                        children: [
                          Text("title:"),
                          SizedBox(
                            width: 12,
                          ),
                          Text(todoProvider.todosList[index].todoName),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Text("isComplete:"),
                          SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Text(todoProvider.todosList[index].isComplete
                                .toString()),
                          ),
                          Checkbox(
                              value: todoProvider.todosList[index].isComplete,
                              onChanged: (value) {
                                context.read<TodoProvider>().updateTodo(
                                    todoProvider.todosList[index].id.toString(),
                                    value);
                              })
                        ],
                      ),
                    ),
                  );
                },
                itemCount: todoProvider.todosList.length,
              );
            });
          }),
    );
  }
}