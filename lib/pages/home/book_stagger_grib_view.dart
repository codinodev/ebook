import 'package:ebooks/models/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'book_item.dart';

class BookSteggerGribView extends StatelessWidget {
  final int selected;
  final PageController pageController;
  final Function callback;
  BookSteggerGribView(this.selected, this.pageController, this.callback,
      {Key? key})
      : super(key: key);
  final bookList = Book.generateBooks();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: PageView(
          controller: pageController,
          onPageChanged: (index) => callback(index),
          children: [
            StaggeredGridView.countBuilder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              crossAxisCount: 4,
              itemCount: bookList.length,
              itemBuilder: (_, index) => BookItem(bookList[index]),
              staggeredTileBuilder: (_) => const StaggeredTile.fit(2),
            ),
            Container()
          ],
        ));
  }
}
