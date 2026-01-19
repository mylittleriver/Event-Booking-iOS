import Foundation

class PaymentService {
    func pay(booking: Booking) async throws -> PaymentStatus {
        return try await APIService.shared.processPayment(for: booking)
    }
}
