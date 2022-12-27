import 'package:clubhouse_ui/Widgets/User_profile_image.dart';
import 'package:clubhouse_ui/screens/room_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../people_info.dart';

class RoomCards extends StatelessWidget {
  final Room room;

  const RoomCards({
    super.key,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => RoomScreen(room: room),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              20.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //* Club Name
                Text(
                  '${room.club} 🏠'.toUpperCase(),
                  style: Theme.of(context).textTheme.overline!.copyWith(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.0,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),

                //* Room Name
                Text(
                  room.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),

                const SizedBox(
                  height: 18,
                ),

                //* 2 Images with Their List deets
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //* image over image
                    Expanded(
                      child: Container(
                        height: 100,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 38.0,
                              top: 20.0,
                              child: UserProfileImage(
                                imageUrl: room.speakers[1].imageUrl,
                                size: 32,
                              ),
                            ),
                            UserProfileImage(
                              imageUrl: room.speakers[0].imageUrl,
                              size: 32.0,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: 15,
                    ),

                    //* details of the room
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...room.speakers.map(
                            (e) => Text(
                              '${e.givenName} ${e.familyName} 🔊',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 16.0),
                            ),
                          ),

                          //* Numbered poeple Values of the room
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  //* Number
                                  TextSpan(
                                    text:
                                        '${room.speakers.length + room.followedBySpeakers.length + room.others.length} ',
                                  ),

                                  //* People Icon
                                  const WidgetSpan(
                                    child: Icon(
                                      CupertinoIcons.person_fill,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                  ),

                                  TextSpan(text: ' / ${room.speakers.length} '),
                                  const WidgetSpan(
                                    child: Icon(
                                      color: Colors.grey,
                                      size: 18,
                                      CupertinoIcons.chat_bubble_fill,
                                    ),
                                  ),
                                ],
                              ),
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
