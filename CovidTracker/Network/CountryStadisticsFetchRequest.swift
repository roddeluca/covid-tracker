import Foundation
import Combine

final class CountryStadisticsFetchRequest: ObservableObject {
    @Published private(set) var detailCountryData: DetailCountryData?

    private var cancellableSet: Set<AnyCancellable> = []
    private let session = URLSession.shared

    func getStats(for countryName: String) {
        let coutryCode = countryName.replacingOccurrences(of: " ", with: "-")

        guard let request = createRequest(with: "https://covid-193.p.rapidapi.com/statistics?country=\(coutryCode)") else { return }

        session.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: StatadisticsResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }) { [weak self] (data) in
                self?.detailCountryData = data.response?.first
            }
            .store(in: &cancellableSet)
    }

    private func createRequest(with url: String) -> URLRequest? {
        guard let url = URL(string: url) else { return nil }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("covid-193.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        request.setValue("d172e810e7msh47584ae043c146dp12d8eejsnb0b3c42c4a59", forHTTPHeaderField: "x-rapidapi-key")

        return request
    }
}
