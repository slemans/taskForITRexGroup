//
//  ViewController.swift
//  taskForITRexGroup
//
//  Created by sleman on 8.02.22.
//

import UIKit

class ViewController: UIViewController {
    
    var currancys: [Currency] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getUrlSession()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let currencyViewController = segue.destination as? CurrencyViewController {
            currencyViewController.currancys = currancys
        } 
    }
    
    private func getUrlSession() {
        ServiseAPI.apiSingl.fetchUrlSession { [weak self] currancy in
            self?.currancys = currancy
            DispatchQueue.main.async {
               
            }
        }
    }
}

