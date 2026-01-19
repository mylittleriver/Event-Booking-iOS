import SwiftUI

struct EventListView: View {
    @StateObject private var vm = EventListViewModel()
    
    var body: some View {
        NavigationView {
            List(vm.events) { event in
                NavigationLink(destination: EventDetailView(event: event)) {
                    VStack(alignment: .leading) {
                        Text(event.title).font(.headline)
                        Text(event.date).font(.subheadline)
                    }
                }
            }
            .navigationTitle("Events")
            .task { await vm.loadEvents() }
        }
    }
}
