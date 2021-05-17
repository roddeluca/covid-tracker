import SwiftUI

struct CountryDataRowView: View {
    var countryData: CountryData

    var body: some View {
        HStack {
            Text(countryData.country)
                .fontWeight(.medium)
                .font(.subheadline)
                .lineLimit(2)
                .frame(width: 110, alignment: .leading)

            Spacer()

            Text(countryData.confirmed.formatNumber())
                .lineLimit(1)
                .minimumScaleFactor(0.7)
                .font(.subheadline)
                .frame(height: 40)
                .padding(.leading, 5)

            Spacer()

            Text(countryData.deaths.formatNumber())
                .lineLimit(1)
                .minimumScaleFactor(0.7)
                .font(.subheadline)
                .foregroundColor(.red)
                .padding(.leading, 5)
                .frame(width: 50, height: 40, alignment: .center)

            Spacer()

            Text(countryData.recovered.formatNumber())
                .lineLimit(1)
                .minimumScaleFactor(0.7)
                .foregroundColor(.green)
                .font(.subheadline)
                .frame(width: 50, height: 40, alignment: .center)
        }
    }
}
