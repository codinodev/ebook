import 'package:ebooks/constants/colors.dart';
import 'package:ebooks/pages/home/widgets/custom_tab.dart';
import 'package:flutter/material.dart';

import 'book_stagger_grib_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tabIndex = 0;
  var bottomIndex = 0;
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          CustomTab(tabIndex, (int index) {
            setState(() {
              tabIndex = index;
            });
            pageController.jumpToPage(index);
          }),
          Expanded(
              child: BookSteggerGribView(
                  tabIndex,
                  pageController,
                  (int index) => setState(() {
                        tabIndex = index;
                      })))
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu_rounded,
            color: Colors.black,
          )),
      title:
          const Text('All Books', style: TextStyle(color: kFont, fontSize: 18)),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_outlined,
              color: kFont,
            ))
      ],
    );
  }

  _buildBottomNavigationBar() {
    final bottoms = [
      Icons.home_outlined,
      Icons.analytics_outlined,
      Icons.keyboard_voice_outlined,
      Icons.bookmark_border_outlined,
      Icons.person_outlined
    ];
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
        width: width,
        height: 56,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => GestureDetector(
                  onTap: () => setState(() {
                    bottomIndex = index;
                  }),
                  child: Container(
                    width: (width - 40) / 5,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: bottomIndex == index
                        ? const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                            width: 3,
                            color: Colors.deepOrange,
                          )))
                        : null,
                    child: Icon(
                      bottoms[index],
                      size: 30,
                      color: bottomIndex == index ? kFont : Colors.grey[400],
                    ),
                  ),
                ),
            separatorBuilder: (_, index) => const SizedBox(
                  width: 10,
                ),
            itemCount: bottoms.length));
  }
}
