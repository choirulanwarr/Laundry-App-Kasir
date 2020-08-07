class list {
  final String name;
  final String count;
  final String imageUrl;

  list({this.imageUrl, this.name, this.count});
}

List<list> categoryData = [
  new list(
      imageUrl: "assets/premium_images/celana.png", name: "TOPS", count: "6"),
  new list(
      imageUrl: "assets/premium_images/jaket.png", name: "BOTTOMS", count: "6"),
  new list(
      imageUrl: "assets/premium_images/kaos.png", name: "DRESSES", count: "6"),
  new list(
      imageUrl: "assets/premium_images/kemeja.png", name: "COATS", count: "6"),
];
