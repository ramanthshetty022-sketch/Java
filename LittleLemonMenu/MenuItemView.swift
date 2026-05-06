swiftimport SwiftUI

struct MenuItemView: View {
    var item: MenuItem

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(item.name)
                .font(.headline)
            Text(item.description)
                .font(.subheadline)
                .foregroundColor(.gray)
            Text(String(format: "$%.2f", item.price))
                .font(.subheadline)
                .foregroundColor(.green)
        }
        .padding(.vertical, 4)
    }
}
