import SwiftUI

struct CountryDetailRow: View {
    var number: String = "-"
    var name: String = "-"
    var color: Color = .primary

    var body: some View {
        VStack {
            HStack {
                Text(name)
                    .font(.body)
                    .padding(5)

                Spacer()

                Text(number)
                    .font(.subheadline)
                    .padding(5)
                    .foregroundColor(color)
            }

            Divider()
        }
        .padding(.leading)
        .padding(.trailing)
    }
}
