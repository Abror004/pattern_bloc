import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc/bloc/update_post_cubit.dart';
import 'package:pattern_bloc/model/post_model.dart';

Widget viewOfUpdate(bool isLoading, BuildContext context,Post post, TextEditingController titleController,TextEditingController bodyController,) {
  return Container(
    padding: EdgeInsets.all(30),
    child: Stack(
      children: [
        Column(
          children: [
            TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: "Title", hintStyle: TextStyle(color: Colors.grey),
                ),
                style: TextStyle(fontSize: 18,color: Colors.black),
                // maxLines: (titleController.text.length/30).toInt()+1,
                // onChanged: (text) {
                //
                // }
            ),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(
                hintText: "body", hintStyle: TextStyle(color: Colors.grey),
              ),
              style: TextStyle(fontSize: 18,color: Colors.black),
              // maxLines: (double.maxFinite).toInt(),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {
                BlocProvider.of<UpdatePostCubit>(context).apiPostUpdate(post);
              },
              color: Colors.blue,
              child: Text(
                "Update a Post",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        isLoading ? Center(child: CircularProgressIndicator(),)
            : SizedBox.shrink(),
      ],
    ),
  );
}