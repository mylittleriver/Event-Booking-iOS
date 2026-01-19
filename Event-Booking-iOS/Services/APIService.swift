import Foundation

class APIService {
    static let shared = APIService()
    
    func fetchEvents() async throws -> [Event] {
        return [
            Event(id: 1, title: "Music Festival", date: "2025-06-18", location: "NYC", description: "Enjoy live music!"),
            Event(id: 2, title: "Tech Conference", date: "2025-07-02", location: "San Francisco", description: "Future of AI.")
        ]
    }
    
    func fetchTicketAvailability(eventId: Int) async throws -> Int {
        return 50
    }
    
    func processPayment(for booking: Booking) async throws -> PaymentStatus {
        return PaymentStatus(success: true, message: "Payment successful!")
    }
}
