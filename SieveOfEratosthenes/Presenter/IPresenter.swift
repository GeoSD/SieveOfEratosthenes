//
//  IPresenter.swift
//  SieveOfEratosthenes
//
//  Created by Georgy Dyagilev on 14/04/2019.
//  Copyright © 2019 Georgy Dyagilev. All rights reserved.
//

import UIKit

protocol IPresenter: AnyObject {
    func set(view: IViewController?)
    func okWith(_ userInput: String) -> Bool
    func calculatePrimeNumbers(from stringNumber: String)
    
    func numberOfItems() -> Int
    func item(for indexPath: IndexPath) -> PrimeNumber
}
