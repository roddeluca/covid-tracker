import Foundation

struct Cases: Decodable {
    let new: String?
    let active: Int
    let critical: Int
    let recovered: Int
    let total: Int

    private enum CodingKeys: String, CodingKey {
        case new
        case active
        case critical
        case recovered
        case total
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        new = try container.decode(String.self, forKey: .new)
        active = try container.decode(Int.self, forKey: .active)
        critical = try container.decode(Int.self, forKey: .critical)
        recovered = try container.decode(Int.self, forKey: .recovered)
        total = try container.decode(Int.self, forKey: .total)
    }
}
