import Foundation

struct Event: Identifiable, Codable {
    let id: Int
    let title: String
    let date: String
    let location: String
    let description: String
}
