//
//  ViewController.swift
//  MoneyConverter
//
//  Created by 김재원 on 2016. 5. 22..
//  Copyright © 2016년 Jaewonism. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currencySegment: UISegmentedControl!
    @IBOutlet weak var sourceMoneyField: UITextField!
    @IBOutlet weak var targetMoneyLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func convertMoney(sender: AnyObject) {
        guard let sourceCurrency = Currency(rawValue: currencySegment.selectedSegmentIndex) else {
            print("Source Currency Error")
            return
        }
        
        guard let sourceAmount = Double(sourceMoneyField.text!) else {
            targetMoneyLabel.text = "Error"
            return
        }
        
        let sourceMoney = Money(sourceAmount, currency: sourceCurrency)
        
        var targetMoneyString: String = ""
        
        for i in 0 ..< 4 {
            targetMoneyString += sourceMoney.valueInCurrency(Currency.init(rawValue: i)!) + "\r\n"
        }
        
        targetMoneyLabel.text = targetMoneyString
    }
}

