//
//  SpendingsListSpendingsListDisplayManagerOutput.swift
//  Cashmeter
//
//  Created by Sergey Butorin on 21/04/2018.
//  Copyright © 2018 Sergey Butorin. All rights reserved.
//

import Foundation

protocol SpendingsListDisplayManagerOutput: class {
    
    /**
     Метод запрашивает количество секций.
     */
    func requestSectionsCount() -> Int
    
    /**
     Метод запрашивает количество ячеек в секции.
     
     @param section - номер секции.
     */
    func requestRowsCount(in section: Int) -> Int
    
    /**
     Метод запрашивает ячейку.
     
     @param indexPath - индекс ячейки.
     */
    func requestCellObject(at indexPath: IndexPath) -> TableCellObject
    
}