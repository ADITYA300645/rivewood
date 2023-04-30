import 'package:flutter/material.dart';
import 'package:rivewood/pages/profile/widgets/SettingOptons/SettingOptions.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 60,
              ),
              Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("NAME OF USER",
                        style: Theme.of(context).textTheme.titleMedium),
                    ElevatedButton(
                        onPressed: () {}, child: Text("BUTTON TO EDIT IT"))
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          SettingOptions()
        ],
      ),
    );
    ;
  }
}
