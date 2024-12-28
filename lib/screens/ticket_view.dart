import 'package:flutter/material.dart';
import 'package:rec_events/utils/app_layout.dart';
import 'package:rec_events/utils/app_styles.dart';
import 'package:rec_events/widgets/thick_container.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width,
      height: 200,
      child: Container(
        margin: EdgeInsets.only(left: 16),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Styles.backgroundColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(21), topRight: Radius.circular(21)),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Event 1", style: Styles.headlineStyle3.copyWith(color: Colors.white),),
                      const Spacer(),
                      ThickContainer(),
                      Expanded(
                        child: SizedBox(
                        height: 24,
                        child: Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(5, (index) => Text("-", style: TextStyle(color: Colors.white),)),
                        ),
                      )),
                      ThickContainer(),
                      const Spacer(),
                      Text("Club 1", style: Styles.headlineStyle3.copyWith(color: Colors.white),),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}