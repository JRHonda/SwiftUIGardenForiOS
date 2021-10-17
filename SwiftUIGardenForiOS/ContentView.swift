//
//  ContentView.swift
//  SwiftUIGardenForiOS
//
//  Created by Justin Honda on 10/16/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            NavigationView {
                Text("Page One")
            }.tabItem {
                Image(systemName: "1.square.fill")
                Text("First")
            }
            
            NavigationView {
                RegulatoryListView(viewModel: .init(dataModel: .init(appVersion: "2.2.0 (2834)", shouldShowEURegulatory: true, shouldShowUDIInRegulatory: true, shouldHideRegulatory: false)))
            }
            .tabItem {
                Image(systemName: "2.square.fill")
                Text("Second")
            }
        }
    }
    
}


// MARK: - Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// MARK: - Test Views

fileprivate struct TestDestinationView: View {
    let text: String
    var body: some View { Text(text) }
}
