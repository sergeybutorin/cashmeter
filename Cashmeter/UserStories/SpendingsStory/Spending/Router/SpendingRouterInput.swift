//
//  SpendingRouterInput.swift
//  Cashmeter
//
//  Created by Sergey Butorin on 15/04/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

protocol SpendingRouterInput: class {
    
    /**
     Метод открывает модуль сканирования QR-кодов
     */
    func showScanQrModule(moduleOutput: QRScannerModuleOutput)
    
    /**
     Метод открывает модуль со списком позиций в покупке.
     */
    func showItemsList(spendingItems: [SpendingItemInfo])
    
    /**
     Метод закрывает модуль.
     */
    func closeModule()
    
}
