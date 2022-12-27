// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:clubhouse_ui/Widgets/User_profile_image.dart';
import 'package:clubhouse_ui/Widgets/room_card.dart';
import 'package:clubhouse_ui/Widgets/upcoming_rooms.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../people_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.search,
            color: Colors.black,
          ),
        ),
        actions: [
          //todo Icons
          IconButton(
            onPressed: () {},
            icon: const Icon(
              color: Colors.black,
              CupertinoIcons.envelope_open,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              color: Colors.black,
              CupertinoIcons.calendar,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              color: Colors.black,
              CupertinoIcons.bell,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: UserProfileImage(
                imageUrl: currentUser.imageUrl,
                size: 25,
              ),
            ),
          ),
        ],
      ),

      //todo Body of screen
      body: ListView(
        padding:
            const EdgeInsets.only(bottom: 120, left: 20, right: 20, top: 20),
        children: [
          //todo One single card of details here
          const UpComingRooms(upcomingRooms: upcomingRoomsList),

          const SizedBox(
            height: 12.0,
          ),

          // todo room cards from here
          ...roomsList.map(
            (e) => RoomCards(room: e),
          ),
        ],
      ),
    );
  }
}
