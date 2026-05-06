swiftimport SwiftUI

struct ContentView: View {
    @StateObject var menuList = MenuList()

    var body: some View {
        NavigationView {
            List(Category.allCases, id: \.self) { category in
                NavigationLink(destination: MenuView(menuList: menuList, category: category)) {
                    Text(category.rawValue)
                        .font(.headline)
                }
            }
            .navigationTitle("Little Lemon Menu")
        }
    }
}
