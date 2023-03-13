import 'package:flutter/material.dart';
import 'package:wallet_app/db/db_category/category_db.dart';
import 'package:wallet_app/models/category/category_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:wallet_app/screens/category/Edit%20Category/edit_category_popup.dart';

class IncomeCategoryList extends StatelessWidget {
  const IncomeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CategoryDB().incomeCategoryListListener,
      builder: (BuildContext ctx, List<CategoryModel> newList, Widget? child) {
        return ListView.separated(
          itemBuilder: (context, index) {
            final category = newList[index];
            return Slidable(
              key: Key(category.id),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (ctx) {
                      showEditCategoryPopup(context);
                    },
                    icon: Icons.edit,
                    label: 'Edit',
                  ),
                  SlidableAction(
                    onPressed: (ctx) {
                      showDialog(
                        context: context,
                        builder: ((context) {
                          return AlertDialog(
                            content: const Text(
                              'Do you want to Delete',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: (() {
                                      Navigator.of(context).pop();
                                    }),
                                    child: const Text(
                                      'No',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: (() {
                                      CategoryDB.instance
                                          .deleteCategory(category.id);
                                      Navigator.of(context).pop();
                                    }),
                                    child: const Text(
                                      'Yes',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }),
                      );
                    },
                    icon: Icons.delete,
                    label: 'Delete',
                    foregroundColor: Colors.red,
                  ),
                ],
              ),
              child: Card(
                margin: const EdgeInsets.all(10),
                color: Colors.green,
                child: ListTile(
                  title: Text(
                    category.name,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 0,
            );
          },
          itemCount: newList.length,
        );
      },
    );
  }
}
