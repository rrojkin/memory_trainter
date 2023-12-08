//
//  ViewController.swift
//  MemoryTrainer
//
//  Created by Antony Razhnou on 12/8/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let test = WordsClass()
        
        view.backgroundColor = .red
        
        for _ in 1...5 {
            print(test.getRandomWord(.one, .fiveLetters, .five))
        }
        
        print("Hello!")
    }


}

