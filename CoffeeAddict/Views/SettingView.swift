//
//  SettingView.swift
//  CoffeeAddict
//
//  Created by Muhammad Zalfa on 02/12/22.
//

import SwiftUI

struct SettingView: View {
    
    
    @AppStorage("switchMode") var switchMode: Bool = false
    
    
    // MARK: Body
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    sectionInfo
                    
                    themeMode
                    
                    appInfo
                } // MARK: VStack
                
            } // MARK: ScrollView
        } // MARK: NavigationStack
        .preferredColorScheme(switchMode ? .dark : .light)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
            .preferredColorScheme(.dark)
    }
}

struct SettingsRow: View {
    var labelText: String
    var labelImage: String
    var body: some View {
        HStack {
            Text(labelText.uppercased())
            Spacer()
            Image(systemName: labelImage)
        }
    }
}

struct ExtractedView: View {
    var name: String
    var content: String?
    var linkLabel: String?
    var linkDestination: String?
    
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            HStack{
                Text(name).foregroundColor(.gray)
                Spacer()
                if (content != nil) {
                    Text(content ?? "N/A")
                } else if(linkLabel != nil && linkDestination != nil) {
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
                        .tint(.secondary)
                    Image(systemName: "arrow.up.right.square").foregroundColor(.purple)
                } else{
                    EmptyView()
                }
            }
        }
    }
}

extension SettingView {
    private var sectionInfo: some View {
        GroupBox {
            Divider().padding(.vertical, 4)
            HStack(spacing: 10) {
                Image("logo-full")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .cornerRadius(9)
                
                Text("SwiftUI helps you build great-looking apps across all Apple platforms with the power of Swift — and surprisingly little code. You can bring even better experiences to everyone, on any Apple device, using just one set of tools and APIs.")
                    .font(.system(size: 12))
            }
        } label: {
            SettingsRow(labelText: "SwiftUI sesi 5", labelImage: "info.circle")
        }
        .padding()
    }
    
    private var appInfo: some View {
        GroupBox {
            ExtractedView(name: "haha", content: "lolo")
            ExtractedView(name: "website", linkLabel: "github", linkDestination: "github.com")
        } label: {
            SettingsRow(labelText: "world", labelImage: "iphone")
        }
        .padding()
    }
    
    private var themeMode: some View {
        GroupBox {
            Divider().padding(.vertical, 4)
            Text("bolehbolehbolehbolehbolehboleh")
                .padding(.vertical, 8)
                .frame(minHeight: 60)
            
            Toggle(isOn: $switchMode) {
                Text("Switch mode dong".uppercased())
                    .font(.footnote)
            }
        } label: {
            SettingsRow(labelText: "Theme", labelImage: "paintbrush")
        }
        .padding()
    }
}
