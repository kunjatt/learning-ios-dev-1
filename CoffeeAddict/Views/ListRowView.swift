//
//  ListRowView.swift
//  CoffeeAddict
//
//  Created by Muhammad Zalfa on 02/12/22.
//

import SwiftUI

struct ListRowView: View {
    // MARK: - PROPERTIES
    var loans: Loans
    
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(loans.name)
                    .font(.system(.headline, design: .rounded))
                    .fontWeight(.bold)
                
                Text(loans.country)
                    .font(.system(.subheadline, design: .rounded))
                
                Text(loans.use)
                    .font(.system(.body, design: .rounded))
                
            } //: VSTACK
            
            Text("$\(loans.amount)")
                .font(.system(.title, design: .rounded))
                .fontWeight(.bold)
            
        } //: HSTACK
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

// MARK: - PREVIEW
struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(loans: Loans(name: "Russel", country: "Rusia", use: "To buy a house for my horse", amount: 876))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
