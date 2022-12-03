//
//  ContentView.swift
//  CoffeeAddict
//
//  Created by Muhammad Zalfa on 19/11/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: PROPERTIES
    @State private var selectedTab: Tabs = .browse
    
    // MARK: BODY
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                CoffeeMainView()
                    .listStyle(.plain)
                    .tabItem {
                        Image(systemName: "square.grid.2x2")
                        Text("Browse")
                    }
                    .tag(Tabs.browse)
                VStack {
                    Text("watch".uppercased())
                        .font(.system(.title, design: .rounded))
                    Button {
                        selectedTab = Tabs.profile
                    } label: {
                        Text("Show Profile")
                            .font(.system(.headline, design: .rounded))
                            .padding()
                            .foregroundColor(.white)
                            .background(.black)
                            .cornerRadius(10)
                            .padding()
                    }

                } // MARK: VStack
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Watch")
                }
                .tag(Tabs.watch)
                Text("loans".uppercased())
                    .font(.system(.title, design: .rounded))
                    .tabItem {
                        Image(systemName: "rectangle.and.text.magnifyingglass")
                        Text("Loans")
                    }
                    .tag(Tabs.loans)
                SettingView()
                    .font(.system(.title, design: .rounded))
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                    .tag(Tabs.profile)
            } // MARK: TABVIEW
            .tint(.blue)
        } // MARK: NAVIGATION STACK
        
    }
}

// MARK: PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum Tabs: String {
    case browse
    case watch
    case loans
    case profile
}
