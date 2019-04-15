//
//  IPresenter.swift
//  SieveOfEratosthenes
//
//  Created by Georgy Dyagilev on 14/04/2019.
//  Copyright © 2019 Georgy Dyagilev. All rights reserved.
//

import UIKit

protocol IPresenter: AnyObject {
    func setIViewController(iViewController: IViewController?)
    func numberOfItems() -> Int
    func calculatePrimeNumbers(from stringNumber: String)
    func primeNumberFor(index: Int) -> Int
    func sizeForItemAt(_ indexPath: IndexPath) -> CGSize
}
