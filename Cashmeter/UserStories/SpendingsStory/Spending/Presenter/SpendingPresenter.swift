//
//  SpendingPresenter.swift
//  Cashmeter
//
//  Created by Sergey Butorin on 15/04/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

import Foundation

final class SpendingPresenter {
    
    weak var view: SpendingViewInput!
    var interactor: SpendingInteractorInput!
    var router: SpendingRouterInput!
    var output: SpendingModuleOutput?
    var cellObjectsFactory: SpendingCellObjectsFactoryInput!
    
    var spendingInfo = SpendingInfo()
    
}

// MARK: SpendingModuleInput

extension SpendingPresenter: SpendingModuleInput {
    
    func setup(with spending: Spending) {
        self.spendingInfo = SpendingInfo(from: spending)
    }
    
}

// MARK: SpendingViewOutput

extension SpendingPresenter: SpendingViewOutput {
    
    func viewIsReady() {
        view.setupInitialState()
        var cellObjects: [TableCellObject] = []
        let categories = interactor.requestCategories()
        cellObjects = cellObjectsFactory.convert(spendingInfo: spendingInfo, categories: categories)
        spendingInfo.category = categories.first
        view.showData(cellObjects)
    }
    
    func didTapButton(with type: SpendingButtonType) {
        print("Tap button")
    }
    
    func didTriggerScanQrAction() {
        router.showScanQrModule(moduleOutput: self)
    }
    
    func didTapOnClose() {
        router.closeModule()
    }
    
    func didTapOnSave() {
        interactor.addSpending(spendingInfo: spendingInfo)
    }
    
    func didChangeAmountValue(_ value: String?) {
        guard let value = value, let amount = Double(value) else { return }
        spendingInfo.amount = amount
    }
    
    func didChangeDateValue(_ value: Date?) {
        guard let value = value else { return }
        spendingInfo.date = value
    }
    
}

// MARK: QRScannerModuleOutput

extension SpendingPresenter: QRScannerModuleOutput {
    
    func scanIsFinished(_ scannedString: String) {
        print(scannedString)
        guard let receipt = ReceiptData(fromQrString: scannedString) else {
            print("Ошибка") // TODO: move and process errror
            return
        }
        interactor.parseReceipt(receipt)
    }
    
}
