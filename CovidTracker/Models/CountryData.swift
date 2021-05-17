import Foundation

struct CountryData: Decodable {
    let deaths: Int
    let critical: Int
    let confirmed: Int
    let recovered: Int
    let country: String
    let latitude: Double?
    let longitude: Double?

    var fatalityRate: Double {
        (100.00 * Double(deaths)) / Double(confirmed)
    }

    var recoveredRate: Double {
        (100.00 * Double(recovered)) / Double(confirmed)
    }
}

let countryDataMock = CountryData(deaths: 200, critical: 100, confirmed: 20, recovered: 50, country: "Argentina", latitude: 0.0, longitude: 0.0)
