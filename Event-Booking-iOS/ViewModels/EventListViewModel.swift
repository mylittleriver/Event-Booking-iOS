import Foundation
import Combine

@MainActor
class EventListViewModel: ObservableObject {
    @Published var events: [Event] = []
    
    func loadEvents() async {
        do {
            events = try await APIService.shared.fetchEvents()
        } catch {
            print("Error loading events:", error)
        }
    }
}
