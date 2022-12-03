//
//  CoffeeMainView.swift
//  CoffeeAddict
//
//  Created by Muhammad Zalfa on 19/11/22.
//

import SwiftUI
import ActivityView

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
                    List(coffeeSearchResults) { result in
                        NavigationLink(destination:{
                            DetailsCoffeeView(CoffeeDetails: result)
                        }){
                            CoffeeRow(coffee: result)
                        }
                        .listRowSeparator(.hidden)
                        
                    }
                    
                    .listStyle(.plain)
                    .navigationTitle("List Coffee Shop")
                    .searchable(
                        text: $searchText,
                        prompt: "Cari Coffee Shop apa?"
                    ){
                        ForEach(coffeeSearchSuggestion) { suggestion in
                            Text("Looking for \(suggestion.name)")
                                .searchCompletion(suggestion.name)
                        }
                    }
                    
            } //MARK: Navigation
            
        } // MARK: VStack
        
    }
}

//MARK: Preview
struct CoffeeMainView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeMainView()
    }
}

struct CoffeeRow: View {
    @State var coffee: CoffeeShop
    @State var item: ActivityItem?
    
    var body: some View {
        HStack{
            Image("\(coffee.image)")
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .frame(width: 120)
            
            VStack(alignment: .leading){
                
                Text("\(coffee.name)")
                    .font(.system(size: 24))
                    .bold()
                    .padding(.bottom, 4)
                Text("\(coffee.location)")
                    .font(.system(size: 18))
                    .fontWeight(.regular)
                    .foregroundColor(.black.opacity(0.4))
                    .padding(.bottom, 2)
                Text("Rating 4.5/5")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                if coffee.isFavorite {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.pink)
                        .padding(.vertical)
                }
                
            }
            
        } // MARK: HStack
        .swipeActions(edge: .leading, allowsFullSwipe: false) {
            Button {
                
            } label: {
                Image(systemName: "pin")
            }
            .tint(.yellow)
            
            Button {
                
            } label: {
                Image(systemName: "square.and.arrow.up")
            }
            .tint(.indigo)
        }
        .contextMenu {
            Button {
                item = ActivityItem(items: "Coffeeshop with name: \(coffee.name) will be shared!!!")
            } label: {
                HStack {
                    Text("Share coffeeshop")
                    Image(systemName: "square.and.arrow.up")
                }
            }
            
            Button {
                coffee.isFavorite.toggle()
            } label: {
                Text(coffee.isFavorite ? "Remove from favorite" : "Mark as favorite")
                Image(systemName: "heart")
            }
        }
        
    }
}
