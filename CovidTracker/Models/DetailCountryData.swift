import Foundation

struct DetailCountryData: Decodable {
    let cases: Cases?
    let deaths: Death?
    let tests: Test?
    let day: String?
    let time: String?

    private enum CodingKeys: String, CodingKey {
        case cases
        case deaths
        case tests
        case day
        case time
    }

    var fatalityRate: Double {
        guard let totalDeaths = deaths?.total, let totalCases = cases?.total else { return 0.0 }

        return (100.00 * Double(totalDeaths)) / Double(totalCases)
    }

    var recoveredRate: Double {
        guard let totalRecovered = cases?.recovered, let totalCases = cases?.total else { return 0.0 }

        return (100.00 * Double(totalRecovered)) / Double(totalCases)
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        cases = try? container.decode(Cases.self, forKey: .cases)
        deaths = try? container.decode(Death.self, forKey: .deaths)
        tests = try? container.decode(Test.self, forKey: .tests)
        day = try? container.decode(String.self, forKey: .day)
        time = try? container.decode(String.self, forKey: .time)
    }
}
