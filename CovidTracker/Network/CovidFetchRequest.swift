import Foundation
import Combine

final class CovidFetchRequest: ObservableObject {
    @Published var allCountryData: [CountryData] = []
    @Published private(set) var isLoading = false

    private var cancellableSet: Set<AnyCancellable> = []
    private let session = URLSession.shared

    func getAllCountries() {
        guard let request = createRequest(with: "https://covid-19-data.p.rapidapi.com/country/all?format=json") else { return }
        
        isLoading = true
        
        session.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: [CountryData].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { suscriberCompletion in
                self.isLoading = false
            }) { [weak self] (data) in
                self?.allCountryData = data
            }
            .store(in: &cancellableSet)
    }

    private func createRequest(with url: String) -> URLRequest? {
        guard let url = URL(string: url) else { return nil }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("covid-19-data.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        request.setValue("d172e810e7msh47584ae043c146dp12d8eejsnb0b3c42c4a59", forHTTPHeaderField: "x-rapidapi-key")

        return request
    }
}

