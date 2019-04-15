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
    func calculatePrimeNumbers(from stringNumber: String)
}
