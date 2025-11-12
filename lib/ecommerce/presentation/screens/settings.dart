import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              "https://www.freepik.com/free-vector/blue-circle-with-white-user_145857007.htm#fromView=keyword&page=1&position=0&uuid=c3989fd6-ba86-47fe-b9a3-91ceb891a133&query=Profile+avatar",
            ),
          ),
        ],
      ),
    );
  }
}
