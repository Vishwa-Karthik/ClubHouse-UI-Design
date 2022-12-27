import 'package:clubhouse_ui/Utils/palette.dart';
import 'package:flutter/material.dart';
import '../people_info.dart';

class UpComingRooms extends StatelessWidget {
  final List<Room> upcomingRooms;
  const UpComingRooms({
    super.key,
    required this.upcomingRooms,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.secondaryBackground,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 32.0, top: 4.0, bottom: 4.0),
        child: Column(
          children: upcomingRooms
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //* Time column
                      Padding(
                        padding:
                            EdgeInsets.only(top: e.club.isNotEmpty ? 2.0 : 0),
                        child: Text(e.time),
                      ),

                      //* spacing
                      const SizedBox(
                        width: 12.0,
                      ),

                      //* Club Name
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (e.club.isNotEmpty)
                              Flexible(
                                child: Text(
                                  '${e.club} 🏠'.toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .overline!
                                      .copyWith(
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 1.0,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                            //* Name
                            Flexible(
                              child: Text(
                                e.name,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
