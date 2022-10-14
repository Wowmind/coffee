

class Product{
  final String img;
  final String name;
  final double price;

  Product({
    required this.img,
    required this.name,
    required this.price,
});

  static List<Product>product = [
    Product(img: 'assets/1.png', name: 'Iced Mocha', price: 2.56),
    Product(img: 'assets/2.png', name: 'Cappuccino', price: 2.67),
    Product(img: 'assets/3.png', name: 'Latte Maccahino', price: 2.50),
    Product(img: 'assets/9.png', name: 'lotus latte', price: 2.49),
    Product(img: 'assets/5.png', name: 'Iced Mocha', price: 2.56),
    Product(img: 'assets/6.png', name: 'Cappuccino', price: 2.67),
    Product(img: 'assets/7.png', name: 'Latte Maccahino', price: 2.50),
    Product(img: 'assets/8.png', name: 'lotus latte', price: 2.49),
  ];
}