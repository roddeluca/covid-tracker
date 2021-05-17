import SwiftUI

struct MapContainerView: View {
    @ObservedObject private var covidFetch = CovidFetchRequest()

    var body: some View {
        MapView(countryData: $covidFetch.allCountryData)
            .onAppear {
                covidFetch.getAllCountries()
            }
    }
}
