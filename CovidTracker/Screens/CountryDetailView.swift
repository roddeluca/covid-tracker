import SwiftUI

struct CountryDetailView: View {
    var countryName: String
    var countryData: CountryData

    @ObservedObject private var countryStadisticsFetchRequest = CountryStadisticsFetchRequest()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Date: \(countryStadisticsFetchRequest.detailCountryData?.day ?? "-")")
                    .padding(.leading, 20)
                VStack {
                    CountryDetailRow(number: countryStadisticsFetchRequest.detailCountryData?.cases?.total.formatNumber() ?? "-", name: "Confirmed").padding(.top)
                    CountryDetailRow(number: countryStadisticsFetchRequest.detailCountryData?.cases?.active.formatNumber() ?? "-", name: "Active Cases")
                    CountryDetailRow(number: countryStadisticsFetchRequest.detailCountryData?.cases?.new ?? "-", name: "New Cases")
                    CountryDetailRow(number: countryStadisticsFetchRequest.detailCountryData?.cases?.recovered.formatNumber() ?? "-", name: "Recovered Cases", color: .green)
                    CountryDetailRow(number: countryStadisticsFetchRequest.detailCountryData?.cases?.critical.formatNumber() ?? "-", name: "Critical Cases", color: .yellow)
                    CountryDetailRow(number: countryStadisticsFetchRequest.detailCountryData?.deaths?.total.formatNumber() ?? "-", name: "Deaths", color: .red)
                    CountryDetailRow(number: countryStadisticsFetchRequest.detailCountryData?.deaths?.new ?? "-", name: "New Deaths", color: .red)
                    CountryDetailRow(number: countryStadisticsFetchRequest.detailCountryData?.tests?.total.formatNumber() ?? "-", name: "Tests Done", color: .yellow)
                    CountryDetailRow(number: String(format: "%.2f", countryStadisticsFetchRequest.detailCountryData?.fatalityRate ?? 0.0) + " %", name: "Fatality Rate", color: .yellow)
                    CountryDetailRow(number: String(format: "%.2f", countryStadisticsFetchRequest.detailCountryData?.recoveredRate ?? 0.0) + " %", name: "Recovered Rate", color: .green)
                }
                .background(Color("cardBackgroundGray"))
                .cornerRadius(8)
                .padding()

                Spacer()
            }
            .padding(.top, 25)
            .navigationBarTitle(countryName)
        }
        .onAppear() { fethCoutryStats() }
    }

    private func fethCoutryStats() {
        countryStadisticsFetchRequest.getStats(for: countryName)
    }
}
