//
//  ViewController.swift
//  Midnight
//
//  Created by Bruno Lopes de Mello on 04/02/18.
//  Copyright © 2018 Bruno Lopes de Mello. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var switchTheme: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let weWantMidnight = UserDefaults.standard.value(forKey: "midnightThemeOn") {
            if weWantMidnight as! Bool {
                switchToMidnight()
                self.switchTheme.setOn(true, animated: true)
                print("We like midnight!")
            } else {
                print("we like daylight!")
                //do nothing
            }
            
        } else {
            UserDefaults.standard.setValue(false, forKey: "midnightThemeOn")
            print("This is the first launch ever!")
        }
    }
    
    func switchToMidnight() {
        self.view.backgroundColor = UIColor(displayP3Red: 0, green: 0.329, blue: 0.575, alpha: 1)
        self.image.image = #imageLiteral(resourceName: "moon")
    }
    
    func switchToDaylight() {
        self.view.backgroundColor = UIColor(displayP3Red: 0.462, green: 0.838, blue: 1, alpha: 1)
        self.image.image = #imageLiteral(resourceName: "sun")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func switchFlipped(_ sender: Any) {
        if switchTheme.isOn {
            switchToMidnight()
            print("Switched to midnight")
            UserDefaults.standard.setValue(true, forKey: "midnightThemeOn")
        } else {
            switchToDaylight()
            print("Switched to daylight")
            UserDefaults.standard.setValue(false, forKey: "midnightThemeOn")
        }
    }
    
}

