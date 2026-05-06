swiftimport Foundation

class MenuList: ObservableObject {
    @Published var items: [MenuItem] = [
        MenuItem(name: "Bruschetta", price: 5.99, description: "Grilled bread topped with tomatoes and basil", category: .starters),
        MenuItem(name: "Greek Salad", price: 6.99, description: "Fresh vegetables with feta cheese and olives", category: .starters),
        MenuItem(name: "Grilled Fish", price: 18.99, description: "Fresh catch of the day with lemon butter", category: .mains),
        MenuItem(name: "Pasta Carbonara", price: 14.99, description: "Creamy pasta with bacon and parmesan", category: .mains),
        MenuItem(name: "Lemon Cake", price: 7.99, description: "Moist lemon sponge cake with cream", category: .desserts),
        MenuItem(name: "Baklava", price: 6.49, description: "Honey and nut pastry dessert", category: .desserts)
    ]
}
