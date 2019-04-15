//
//  IPresenter.swift
//  SieveOfEratosthenes
//
//  Created by Georgy Dyagilev on 14/04/2019.
//  Copyright © 2019 Georgy Dyagilev. All rights reserved.
//

import UIKit

protocol IPresenter: AnyObject {
    func numberOfItems() -> Int
    func checkInputed(numberFrom stringNumber: String)
    func primeNumberFor(index: Int) -> UInt
    func sizeForItemAt(_ indexPath: IndexPath) -> CGSize
}
