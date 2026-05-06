swiftimport Foundation

enum Category: String, CaseIterable {
    case starters = "Starters"
    case mains = "Mains"
    case desserts = "Desserts"
}

class MenuItem: Identifiable {
    var id = UUID()
    var name: String
    var price: Double
    var description: String
    var category: Category

    init(name: String, price: Double, description: String, category: Category) {
        self.name = name
        self.price = price
        self.description = description
        self.category = category
    }
}
