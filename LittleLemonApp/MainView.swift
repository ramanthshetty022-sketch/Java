import SwiftUI

struct MainView: View {
    @EnvironmentObject var model: Model

    var body: some View {
        TabView(selection: $model.tabViewSelectedIndex) {
            LocationsView()
                .tag(0)
                .tabItem {
                    if !model.displayingReservationForm {
                        Label("Locations", systemImage: "fork.knife")
                    }
                }
            Text("Reservation")
                .tag(1)
                .tabItem {
                    Label("Reservation", systemImage: "square.and.pencil")
                }
        }
    }
}
