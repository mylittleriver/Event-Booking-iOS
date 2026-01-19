import Foundation
import Combine

@MainActor
class BookingViewModel: ObservableObject {
    @Published var selectedDate: String = ""
    @Published var tickets: Int = 1
    @Published var paymentStatus: PaymentStatus?
    
    private let paymentService = PaymentService()
    
    func confirmBooking(eventId: Int) async {
        let booking = Booking(eventId: eventId, date: selectedDate, tickets: tickets)
        
        do {
            paymentStatus = try await paymentService.pay(booking: booking)
        } catch {
            paymentStatus = PaymentStatus(success: false, message: "Payment failed.")
        }
    }
}
