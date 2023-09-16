import 'package:auth_app_with_api/logic/data/all_users_model.dart';
import 'package:auth_app_with_api/logic/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          var cubit = ProfileCubit.get(context);

          return Text(cubit.profileModel.userName ?? 'Loading...');
        },
      ),
    ), body: BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        ProfileCubit cubit = ProfileCubit.get(context);
        var allUsers = cubit.allUsersModel.allUsers;
        return allUsers == null
            ?const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: allUsers.length,
                itemBuilder: (context, index) {
                  AllUsers user = allUsers[index];
                  return Container(
                    margin: EdgeInsets.all(10),
                    color: Colors.amber,
                    child: Column(
                      children: [
                        Text(user.username ?? 'loading'),
                        Text("${user.phone ?? 0}"),
                        Text(user.email ?? 'loading'),
                      ],
                    ),
                  );
                },
              );
      },
    ));
  }
}
