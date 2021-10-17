//
//  RegulatoryListView.swift
//  SwiftUIGardenForiOS
//
//  Created by Justin Honda on 10/16/21.
//

import SwiftUI

struct RegulatoryListView: View {

    let viewModel: RegulatoryListViewViewModel
    
    var body: some View {
        List {
            /// navigables for web views
            Section {
                NavigationLink("terms_of_use", destination: TestRegulatoryView(description: "Terms of Use"))
                NavigationLink("privacy_notice", destination: TestRegulatoryView(description: "Privacy Notice"))
            }
            
            /// app version
            Section {
                AppVersionCellView(appVersion: viewModel.appVersion)
            }.disabled(true)
            
            /// regulatory
            Section(header: Text("REGULATORY")) {
                if viewModel.shouldShowEURegulatory {
                    RegulatoryContentView(imageSystemName: "star", text: "Ventilator")
                }
                
                showRegulatoryContent(if: viewModel.shouldShowUDIInRegulatory) {
                    RegulatoryContentView(imageSystemName: "circle", text: "UDI 00(80)12345678(90)")
                }
        
                RegulatoryContentView(imageSystemName: "square", text: "Corporate Address (US)")
                
                if viewModel.shouldShowEURegulatory {
                    RegulatoryContentView(imageSystemName: "triangle", text: "Corporate Address (EU)")
                }
                
                RegulatoryContentView(imageSystemName: "square.fill", text: "Manufacturer")
                RegulatoryContentView(imageSystemName: "circle.fill", text: "CE 1234")
            }.disabled(true)
        }
        .listStyle(.grouped)
    }
    
    
    // MARK: - Internal
    
    /// Only for example purposes to show how to implement a `ViewBuilder`
    @ViewBuilder func showRegulatoryContent<Content: View>(`if` condition: Bool, _ showView: () -> Content) -> some View {
        if condition {
            showView()
        }
    }
}


// MARK: - Previews

struct RegulatoryListView_Previews: PreviewProvider {
    static var previews: some View {
        RegulatoryListView(viewModel: .init(dataModel: .init(appVersion: "2.2.0 (2834)", shouldShowEURegulatory: true, shouldShowUDIInRegulatory: true, shouldHideRegulatory: false)))
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
