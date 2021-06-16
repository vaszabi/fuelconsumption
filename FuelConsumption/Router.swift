//
//  Router.swift
//  FuelConsumption
//
//  Created by Szabolcs Varga on 2021. 06. 15..
//

import UIKit

class Router {
    
    weak var viewController: HomeViewController?
    
    func openDetailedView() {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailedViewController") as? DetailedViewController else { return }
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func openSimpleView() {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SimpleViewController") as? SimpleViewController else { return }
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
