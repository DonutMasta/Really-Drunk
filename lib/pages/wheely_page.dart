import 'package:flutter/material.dart';
import 'package:reallydrunk/model/player.dart';
import 'package:reallydrunk/pages/wheel_page.dart';

// ignore: must_be_immutable
class WheelyPage extends StatefulWidget {
  List<Player> players;
  WheelyPage({super.key, required this.players});

  @override
  State<WheelyPage> createState() => _WheelyPageState();
}

class _WheelyPageState extends State<WheelyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Center(
          child: Text(
            widget.players[0].name,
            style: const TextStyle(color: Colors.amber, fontSize: 30),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(margin: EdgeInsets.all(10), child: Wheel()),
        ),
        Expanded(child: BottomList(players: widget.players))
      ]),
    );
  }
}

// ignore: must_be_immutable
class BottomList extends StatelessWidget {
  List<Player> players;
  BottomList({super.key, required this.players});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        child: ElevatedButton(
          child: const Text('Players'),
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 300,
                  color: Colors.amber,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                            child: players.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: players.length,
                                    itemBuilder: ((context, index) => Center(
                                            child: Text(
                                          players[index].name,
                                          style: const TextStyle(
                                              fontSize: 30,
                                              color: Colors.white),
                                        ))))
                                : Container()),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: ElevatedButton(
                            child: const Text('Close'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
