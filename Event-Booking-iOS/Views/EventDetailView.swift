import SwiftUI

struct EventDetailView: View {
    @StateObject private var vm: EventDetailViewModel
    
    init(event: Event) {
        _vm = StateObject(wrappedValue: EventDetailViewModel(event: event))
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(vm.event.title).font(.largeTitle)
            Text(vm.event.description)
            Text("Location: \(vm.event.location)")
            
            Text("Available Tickets: \(vm.availableTickets)")
                .font(.headline)

            NavigationLink("Book Now") {
                CalendarBookingView(event: vm.event)
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
        .task { await vm.loadAvailability() }
    }
}
