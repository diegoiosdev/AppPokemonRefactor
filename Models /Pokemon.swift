import UIKit

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let attack: Int
    let defense: Int
    let name: String
    let imageUrl: String
    let type: String
    let notDescription: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case defense
        case name
        case imageUrl
        case type
        case attack
        case notDescription = "description"
    }
    
}
