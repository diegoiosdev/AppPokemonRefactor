import UIKit

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let attack: Int
    let defense: Int
    let name: String
    let imageUrl: String
    let type: String
    let description: String
}
