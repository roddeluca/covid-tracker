import Foundation

struct TotalData: Decodable {
    let deaths: Int
    let critical: Int
    let confirmed: Int
    let recovered: Int

    var fatalityRate: Double {
        (100.00 * Double(deaths)) / Double(confirmed)
    }

    var recoveredRate: Double {
        (100.00 * Double(recovered)) / Double(confirmed)
    }
}

let totalDataMock = TotalData(deaths: 200, critical: 100, confirmed: 20, recovered: 50)
