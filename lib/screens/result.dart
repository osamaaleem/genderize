import 'package:flutter/material.dart';
import 'package:genderize/models/gender.dart';
import 'package:genderize/networking/network.dart';

class Result extends StatelessWidget {
  String name;
  Result({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Genderize'),),
      body: Center(
        child: FutureBuilder(
            future: Network.getGender(name),
            builder: (context,snapshot){
              if(snapshot.hasData){
                Gender g = snapshot.data!;
                return ListTile(
                  title: Text(g.name),
                  subtitle: Text(g.gender),
                  leading: Text(g.probability.toString()),
                  trailing: Text(g.count.toString()),
                );
              }
              else{
                return const CircularProgressIndicator();
              }
            }
        ),
      ),
    );
  }
}

