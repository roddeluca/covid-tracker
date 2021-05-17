import Foundation

struct Death: Decodable {
    let new: String?
    let total: Int

    private enum CodingKeys: String, CodingKey {
        case new
        case total
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        new = try container.decode(String.self, forKey: .new)
        total = try container.decode(Int.self, forKey: .total)
    }
}
