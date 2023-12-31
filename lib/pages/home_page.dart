import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:reallydrunk/model/player.dart';
import 'package:reallydrunk/pages/wheely_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final player = AudioPlayer();
  late TextEditingController _controller;
  List<Player> players = [];
  Future<void> startPlayer() async {
    player.play(AssetSource('soundtracks/lobby_music.mp3'));
    player.setReleaseMode(ReleaseMode.loop);
  }

  @override
  void initState() {
    super.initState();
    startPlayer();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    player.stop();
    _controller.dispose();
    super.dispose();
  }

  void savePerson() {
    _controller.text.isNotEmpty ? players.add(Player(_controller.text)) : null;
    _controller.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF353531),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        title: Center(
          child: Container(
              height: 100,
              margin: EdgeInsets.only(top: 20),
              child: Image.asset('assets/images/app_logo.png')),
        ),
      ),
      body: Column(children: [
        Spacer(
          flex: 2,
        ),
        Expanded(
            flex: 3,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  width: 200,
                  margin: const EdgeInsets.only(top: 30, bottom: 10),
                  child: TextField(controller: _controller),
                ),
                ElevatedButton(
                    onPressed: savePerson, child: const Text("Submit"))
              ],
            )),
        Expanded(
            flex: 3,
            child: players.isNotEmpty
                ? ListView.builder(
                    itemCount: players.length,
                    itemBuilder: ((context, index) => Center(
                            child: Text(
                          players[index].name,
                          style: const TextStyle(
                              fontSize: 30, color: Color(0XFFF79519)),
                        ))))
                : Container()),
        const Center(
          child: Text(
            "This app was made by Ahmet Caner Tat & Ian Nicholson",
            style: TextStyle(color: Colors.white70, fontSize: 15),
            textAlign: TextAlign.center,
          ),
        ),
        Center(
            child: Container(
                margin: const EdgeInsets.all(50),
                child: ElevatedButton(
                  onPressed: players.isEmpty
                      ? null
                      : () {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          WheelyPage(players: players)))
                              .then((value) => setState(() {}));
                        },
                  child: const Text("Play!"),
                ))),
      ]),
    );
  }
}
