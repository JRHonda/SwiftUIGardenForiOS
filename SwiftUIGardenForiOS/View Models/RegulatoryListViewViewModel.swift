//
//  RegulatoryListViewViewModel.swift
//  SwiftUIGardenForiOS
//
//  Created by Justin Honda on 10/16/21.
//

import Foundation

struct RegulatoryListDataModel {
    let appVersion: String
    let shouldShowEURegulatory: Bool
    let shouldShowUDIInRegulatory: Bool
    let shouldHideRegulatory: Bool
}

class RegulatoryListViewViewModel {
    
    // MARK: - Properties
    private let dataModel: RegulatoryListDataModel
    var shouldShowEURegulatory: Bool { dataModel.shouldShowEURegulatory }
    var shouldShowUDIInRegulatory: Bool { dataModel.shouldShowUDIInRegulatory }
    var shouldHideRegulatory: Bool { !shouldShowEURegulatory && !shouldShowUDIInRegulatory }
    var appVersion: String { dataModel.appVersion }
    
    // MARK: - Init
    init(dataModel: RegulatoryListDataModel) {
        self.dataModel = dataModel
    }
}
