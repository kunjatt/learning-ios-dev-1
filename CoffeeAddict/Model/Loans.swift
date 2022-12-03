//
//  Loans.swift
//  CoffeeAddict
//
//  Created by Muhammad Zalfa on 02/12/22.
//

import Foundation

struct Loans: Identifiable, Codable {
    var id = UUID()
    var name: String
    var country: String
    var use: String
    var amount: Int
    
    init(name: String, country: String, use: String, amount: Int) {
        self.name = name
        self.country = country
        self.use = use
        self.amount = amount
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case country = "location"
        case use
        case amount = "loan_amout"
    }
    
    enum LocationKeys: String, CodingKey {
        case country
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try values.decode(String.self, forKey: .name)
//        self.country = try values.decode(String.self, forKey: .country)
        self.use = try values.decode(String.self, forKey: .use)
        self.amount = try values.decode(Int.self, forKey: .amount)
        
        let location = try values.nestedContainer(keyedBy: LocationKeys.self, forKey: .country)
        self.country = try location.decode(String.self, forKey: .country)
    }
}
