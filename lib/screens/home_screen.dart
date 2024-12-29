import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rec_events/screens/ticket_view.dart';
import 'package:rec_events/utils/app_styles.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello There👋', style: Styles.headlineStyle3,),
                        Gap(5),
                        Text('REC EVENTS', style: Styles.headlineStyle1,),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      child: ImageIcon(AssetImage('assets/images/REC-transparent.png'), color: Styles.textColor),
                    ),
                  ],
                ),
              const Gap(25),
              Container(
                decoration: BoxDecoration(
                  color: Styles.secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(FluentSystemIcons.ic_fluent_search_regular, color: Styles.primaryColor,),
                    Text(' Search', style: Styles.headlineStyle4.copyWith(color: Colors.white), )
                  ],
                ),
              ),
              const Gap(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Upcoming Events', style: Styles.headlineStyle2,),
                  InkWell(
                    onTap: () => print('See All'),
                    child: Text('See All', style: Styles.textStyle.copyWith(color: Styles.accentColor),)
                  ),

                ],
              ),
              ],
            )
          ),
          Gap(5),
          TicketView(),
        ],
      )
    );
  } 
}