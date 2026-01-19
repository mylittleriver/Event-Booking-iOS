import SwiftUI


struct BookingConfirmationView: View {
    let event: Event
    @ObservedObject var vm: BookingViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Confirm Booking")
            Text("Event: \(event.title)")
            Text("Date: \(vm.selectedDate)")
            Text("Tickets: \(vm.tickets)")
            
            Button("Pay Now") {
                Task {
                    await vm.confirmBooking(eventId: event.id)
                }
            }
            .buttonStyle(.borderedProminent)
            
            if let status = vm.paymentStatus {
                Text(status.message)
                    .foregroundColor(status.success ? .green : .red)
            }
            
            Spacer()
        }
        .padding()
    }
}

