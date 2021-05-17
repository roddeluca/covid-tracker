import SwiftUI

struct SearchView: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            TextField("Search Country....", text: $searchText)
                .padding()
        }
        .frame(height: 50)
        .background(Color("cardBackgroundGray"))
    }
}
