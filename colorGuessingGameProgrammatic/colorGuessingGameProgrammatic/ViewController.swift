//
//  ViewController.swift
//  colorGuessingGameProgrammatic
//
//  Created by Kary Martinez on 10/7/19.
//  Copyright © 2019 Kary Martinez. All rights reserved.
//

import UIKit
import Foundation

class ViewController {
    
    private var currentColor: UIColor
    private var currentDominantRGBColor: UIColor
        
    func getNewColor() -> UIColor {
        let randomColorTuple = ViewController.randColor()
        currentColor = randomColorTuple.color
        currentDominantRGBColor = randomColorTuple.dominantColor
        
        return currentColor
        
    }
    lazy var myButton: UIButton = {
        let button = UIButton()
        button.setTitle("Green", for: .normal)
        
        return button
    }()
    
    func isDominant(guess: UIColor) -> Bool {
        return currentDominantRGBColor == guess
    }
        
    static private func randColor() -> (color: UIColor, dominantColor: UIColor) {
        let redValue = CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        let blueValue = CGFloat(drand48())
        let color = UIColor(displayP3Red: redValue, green: greenValue, blue: blueValue, alpha: 1)
        let dominantColor: UIColor
        if max(redValue, greenValue, blueValue) == redValue {
            dominantColor = UIColor.red
        } else if max(redValue, greenValue, blueValue) == greenValue {
            dominantColor = UIColor.green
        } else {
            dominantColor = UIColor.blue
        }
        return (color, dominantColor)
        
    }
    
    init() {
        let randomColorTuple = ViewController.randColor()
        let currentColor = randomColorTuple.color
        let currentDominantColor = randomColorTuple.dominantColor
        
        self.currentColor = currentColor
        self.currentDominantRGBColor = currentDominantColor
    }
}
