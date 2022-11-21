//
//  CoffeeMainView.swift
//  CoffeeAddict
//
//  Created by Muhammad Zalfa on 19/11/22.
//

import SwiftUI

struct CoffeeMainView: View {
    //MARK: Properties
    @State private var searchText: String = ""
    private var coffeeSearchResults: [CoffeeShop] {
        let result = CoffeeShopProvider.all()
//
        if searchText.isEmpty {
            return result
        } else{
            return result.filter{
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
        
            
    }
    
    private var coffeeSearchSuggestion: [CoffeeShop] {
//        let result = CoffeeShopProvider.all()
//
        if searchText.isEmpty {
            return []
        } else{
            return coffeeSearchResults
        }
        
            
    }
    
    //MARK: Body
    var body: some View {
        VStack{
            NavigationStack {
//                HStack{
                    List(coffeeSearchResults) { result in
                        NavigationLink(destination:{
                            DetailsCoffeeView(CoffeeDetails: result)
                            
                        }){
                            HStack{
                                Image("\(result.image)")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(20)
                                    .frame(width: 120)
                                
                                VStack(alignment: .leading){
                                    
                                    Text("\(result.name)")
                                        .font(.system(size: 24))
                                        .bold()
                                        .padding(.bottom, 4)
                                    Text("\(result.location)")
                                        .font(.system(size: 18))
                                        .fontWeight(.regular)
                                        .foregroundColor(.black.opacity(0.4))
                                        .padding(.bottom, 2)
                                    Text("Rating 4.5/5")
                                        .font(.system(size: 14))
                                        .foregroundColor(.gray)
                                    
                                }
    
                            }
                            
                        }
                        
                    }
                
                    .navigationTitle("List Coffee Shop")
                    .searchable(
                        text: $searchText,
                        prompt: "cari kopi?"
                    ){
                        ForEach(coffeeSearchSuggestion) { suggestion in
                            Text("Looking for \(suggestion.name)")
                                .searchCompletion(suggestion.name)
                        }
                    }
                    
//                }
                
            } //MARK: Navigation
            
        }
        
    }
}

//MARK: Preview
struct CoffeeMainView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeMainView()
    }
}
