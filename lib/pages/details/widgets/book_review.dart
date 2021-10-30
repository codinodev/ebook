import 'package:ebooks/constants/colors.dart';
import 'package:ebooks/models/book.dart';
import 'package:flutter/material.dart';

class BookReview extends StatelessWidget {
  final Book book;
  const BookReview(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('${book.score}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                width: 10,
              ),
              _buildStar(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text('${book.ratings} Ratings on Google play',
              style: const TextStyle(color: Colors.grey)),
          const SizedBox(
            height: 15,
          ),
          Text.rich(TextSpan(children: [
            TextSpan(
                text: book.review,
                style:
                    const TextStyle(color: kFont, fontSize: 16, height: 1.8)),
            const TextSpan(
                text: 'Read more', style: TextStyle(color: kFont, fontSize: 16))
          ]))
        ],
      ),
    );
  }

  Widget _buildStar() {
    final List<Color> color = [
      Colors.amber,
      Colors.amber,
      Colors.amber,
      Colors.amber,
      Colors.grey.withOpacity(0.3),
    ];
    return Row(
        children: color
            .map((e) => Icon(
                  Icons.star,
                  size: 25,
                  color: e,
                ))
            .toList());
  }
}
