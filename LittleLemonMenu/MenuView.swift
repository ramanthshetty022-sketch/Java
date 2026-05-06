swiftimport SwiftUI

struct MenuView: View {
    @ObservedObject var menuList: MenuList
    var category: Category

    var filteredItems: [MenuItem] {
        menuList.items.filter { $0.category == category }
    }

    var body: some View {
        List(filteredItems) { item in
            NavigationLink(destination: MenuItemDetailView(item: item)) {
                MenuItemView(item: item)
            }
        }
        .navigationTitle(category.rawValue)
    }
}
