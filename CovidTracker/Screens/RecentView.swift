import SwiftUI

struct RecentView: View {
    @ObservedObject private var covidFetch = CovidFetchRequest()

    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                if covidFetch.isLoading {
                    ProgressView()
                } else {
                    SearchView(searchText: $searchText)
                    ListHeaderView()
                    List {
                        ForEach(covidFetch.allCountryData.filter {
                            guard !searchText.isEmpty else { return true }

                            return $0.country.lowercased().contains(searchText.lowercased())

                        }, id: \.country) { countryData in
                            NavigationLink(destination: CountryDetailView(countryName: countryData.country,
                                                                          countryData: countryData),
                                           label: {
                                            CountryDataRowView(countryData: countryData)
                                           })
                        }
                    }
                    .listStyle(InsetListStyle())
                }
            }
            .navigationBarTitle("Recent Data", displayMode: .inline)
        }.onAppear {
            covidFetch.getAllCountries()
        }
    }
}
