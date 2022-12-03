//
//  LoanStore.swift
//  CoffeeAddict
//
//  Created by Muhammad Zalfa on 02/12/22.
//

import Foundation

class LoanStore: Decodable, ObservableObject {
    @Published var loans: [Loans] = []
    private static var baseUrl = "https://api.kivaws.org/v1/loans/newest.json"
    
    enum CodingKeys: CodingKey {
        case loans
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        loans = try values.decode([Loans].self, forKey: .loans)
    }
    
//    func fetchLatestLoan() {
//        guard let loanURL = URL(string: LoanStore.baseUrl) else {return}
//        
//        let request = URLRequest(url: loanURL)
//    }

}
