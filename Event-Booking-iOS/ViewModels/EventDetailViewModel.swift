import Foundation
import Combine

@MainActor
class EventDetailViewModel: ObservableObject {
    @Published var event: Event
    @Published var availableTickets: Int = 0
    
    private let ticketService = TicketService()
    
    init(event: Event) {
        self.event = event
    }
    
    func loadAvailability() async {
        do {
            availableTickets = try await ticketService.checkAvailability(eventId: event.id)
        } catch {
            print("Error checking tickets:", error)
        }
    }
}
