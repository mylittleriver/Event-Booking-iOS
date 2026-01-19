import Foundation

class TicketService {
    func checkAvailability(eventId: Int) async throws -> Int {
        return try await APIService.shared.fetchTicketAvailability(eventId: eventId)
    }
}
