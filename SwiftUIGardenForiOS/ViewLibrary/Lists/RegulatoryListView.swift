//
//  RegulatoryListView.swift
//  SwiftUIGardenForiOS
//
//  Created by Justin Honda on 10/16/21.
//

import SwiftUI

struct RegulatoryListView: View {

    let appVersion: String
    
    var body: some View {
        List {
            Section {
                NavigationLink("terms_of_use", destination: TestRegulatoryView(description: "Terms of Use"))
                NavigationLink("privacy_notice", destination: TestRegulatoryView(description: "Privacy Notice"))
            }
            
            Section {
                AppVersionCellView(appVersion: appVersion)
            }.disabled(true)
            
            Section(header: Text("REGULATORY")) {
                RegulatoryContentView(imageSystemName: "circle", text: "12345678(90)")
                RegulatoryContentView(imageSystemName: "square", text: "12345678(90)")
                RegulatoryContentView(imageSystemName: "triangle", text: "12345678(90)")
            }.disabled(true)
        }
        .listStyle(.grouped)
    }
    
}


// MARK: - Previews

struct RegulatoryListView_Previews: PreviewProvider {
    static var previews: some View {
        RegulatoryListView(appVersion: "2.2.0 (2834)")
    }
}


// MARK: - Composite Views

struct RegulatoryContentView: View {
    let imageSystemName: String
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: imageSystemName)
            Text(text)
            Spacer()
        }
    }
}

struct AppVersionCellView: View {
    let appVersion: String
    
    var body: some View {
        HStack {
            Text("app_version")
            Spacer()
            Text(appVersion)
        }
    }
}


// MARK: - Test Views

fileprivate struct TestRegulatoryView: View {
    let description: String
    var body: some View {
        Text(description)
    }
}
