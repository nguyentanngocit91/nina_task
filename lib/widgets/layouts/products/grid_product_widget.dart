import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridProductWidget extends StatelessWidget {
  const GridProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 15,
      itemCount: 10,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          children: [
            CachedNetworkImage(
              imageUrl:
                  "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/27af374a-c1a1-449a-a669-6973537cd65b/sb-zoom-blazer-low-pro-gt-skate-shoes-xMq2vr.png",
              fit: BoxFit.contain,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Tên sản phẩm"),
          ],
        );
      },
    );
  }

  Widget ItemProduct() {
    return Container(
      child: Column(
        children: [],
      ),
    );
  }
}
