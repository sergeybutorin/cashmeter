//
//  SpendingDataDisplayManagerOutput.swift
//  Cashmeter
//
//  Created by Sergey Butorin on 15/04/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

import Foundation

protocol SpendingDataDisplayManagerOutput: class {
    
    /**
     Метод сообщает о том, что пользователь нажал на кнопку.
     */
    func didTapButton(with type: SpendingButtonType)
    
    /**
     Метод сообщает о том, что пользователь нажал на ячейку сканирования QR-кода.
     */
    func didTriggerScanQrAction()

    /**
     Метод сообщает о том, что сумма была изменена.
     */
    func didChangeAmountValue(_ value: String?)
    
    /**
     Метод сообщает о том, что дата была изменена.
     */
    func didChangeDateValue(_ value: Date?)
    
}
