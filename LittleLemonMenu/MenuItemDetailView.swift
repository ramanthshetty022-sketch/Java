swiftimport SwiftUI

struct MenuItemDetailView: View {
    var item: MenuItem

    var body: some View {
        VStack(spacing: 16) {
            Text(item.name)
                .font(.largeTitle)
                .bold()
            Text(item.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
            Text(String(format: "$%.2f", item.price))
                .font(.title2)
                .foregroundColor(.green)
            Spacer()
        }
        .padding()
        .navigationTitle(item.name)
    }
}
