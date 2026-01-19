import SwiftUI

struct CalendarBookingView: View {
    let event: Event
    @StateObject private var vm = BookingViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Select a date for booking")
            
            TextField("YYYY-MM-DD", text: $vm.selectedDate)
                .textFieldStyle(.roundedBorder)
            
            Stepper("Tickets: \(vm.tickets)", value: $vm.tickets, in: 1...10)
            
            NavigationLink("Proceed to Payment") {
                BookingConfirmationView(event: event, vm: vm)
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
    }
}
