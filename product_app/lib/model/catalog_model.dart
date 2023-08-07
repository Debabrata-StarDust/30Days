class Item {
  final String id;
  final String name;
  final String description;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.color,
      required this.image});
}

final product = [
  Item(
      id: "Codepur001",
      name: "iPhone 12 pro",
      description: "Apple iPhone 12th generation",
      price: 999,
      color: "#33505a",
      image:
          "https://cdn.dxomark.com/wp-content/uploads/medias/post-61183/iphone-12-pro-blue-hero.jpg")
];