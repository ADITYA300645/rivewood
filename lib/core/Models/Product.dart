class Product {
  late String id;
  late String name;
  late int price;
  late int discount;
  late int imagesCount;
  late String description;
  late List<String> categories = [];
  late List<String> tags = [];

  Product(
      {required this.name,
      required this.id,
      required this.price,
      required this.categories,
      required this.description,
      required this.discount,
      required this.tags});

  Product.fromJson(Map<String, dynamic> json) {
    var product = json["product"];
    // var product = json;
    id = product["_id"];
    name = product["name"];
    price = product["price"];
    discount = product["discount"];
    description = product["description"];
    imagesCount = product["imagesCount"];
    if (categories == null) {
      categories = [];
      product["categories"].forEach((e) => categories.add(e));
    }
    if (tags == null) {
      tags = [];
      // todo backend implementation of tag to provide it in Each
      // product["tags"].forEach((e) => tags!.add(e));
    }
  }
}
