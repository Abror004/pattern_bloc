import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pattern_bloc/bloc/list_post_cubit.dart';
import 'package:pattern_bloc/model/post_model.dart';

Widget itemOfPost(BuildContext context,Post post) {
  return Slidable(
    endActionPane: ActionPane(
      extentRatio: 0.25,
      motion: ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            BlocProvider.of<ListPostCubit>(context).apiPostDelete(post);
          },
          backgroundColor: Color(0xFFFE4A49),
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: "Delete",
        ),
      ],
    ),
    startActionPane: ActionPane(
      motion: ScrollMotion(),
      extentRatio: 0.25,
      children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            BlocProvider.of<ListPostCubit>(context).callUpdatePage(context, post);
          },
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: "Edit",
        ),
      ],
    ),
    child: Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title!.toUpperCase(),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(post.body!),
        ],
      ),
    ),
  );
}