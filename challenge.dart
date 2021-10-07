import 'dart:core';

class Product {
  String id, name;
  List<String> slas;
  Product({required this.id, required this.name, required this.slas});
}

void main() => LogisticInfo([
      Product(
        id: "1234",
        name: "Camisa polo",
        slas: ["Entrega Agendada", "Entrega Correios"],
      ),
      Product(
        id: "567",
        name: "Calça jeans",
        slas: ["Entrega Correios", "Retirada em loja"],
      ),
      Product(
        id: "890",
        name: "Vestido",
        slas: ["Retirada em loja"],
      )
    ]);

void LogisticInfo(List<Product> products) {
  Map<String, dynamic> _result = {};
  _result = createNewMap(products, _result);
  _result.forEach((key, value) {
    print('[SLA] = ' + key);
    for (var productName in value) print('[Product Name] = ' + productName);
    print('--');
  });
}

Map<String, dynamic> createNewMap(listProducts, map) {
  // Create Map<"SLA", dynamic>
  for (var product in listProducts) {
    for (var i in product.slas) map[i] = [];
  }
  // Update Map<"SLA", List<"ProductNames">>
  map.forEach((key, value) {
    for (var product in listProducts) {
      for (var nameSla in product.slas) {
        if (nameSla == key) value.add(product.name);
      }
    }
  });
  return map;
}
