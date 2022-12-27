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
      body: Stack(
        children: [
          //* Cards
          ListView(
            padding: const EdgeInsets.only(
                bottom: 120, left: 20, right: 20, top: 20),
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

          //* bottom glass morhphism effect
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                    Theme.of(context).scaffoldBackgroundColor,
                  ],
                ),
              ),
            ),
          ),

          //* Start room
          Positioned(
            bottom: 60.0,
            left: 110,
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: const Text.rich(
                TextSpan(
                  children: [
                    //* + button
                    WidgetSpan(
                      child: Icon(
                        CupertinoIcons.add,
                        size: 21.0,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: 'Start a room',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //*  menu icon + dot
          Positioned(
              bottom: 60.0,
              right: 40.0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.circle_grid_3x3_fill,
                      size: 38.0,
                    ),
                  ),
                  Positioned(
                    right: 2,
                    bottom: 8,
                    child: Container(
                      height: 20.0,
                      width: 20.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
