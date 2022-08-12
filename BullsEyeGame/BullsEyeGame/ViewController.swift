//
//  ViewController.swift
//  BullsEyeGame
//
//  Created by Ahmet on 12.08.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!



    
    var currentValue: Int = 50
    var targetValue = 0
    var score = 0
    var round = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        // Do any additional setup after loading the view.
    }


    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        score += points

        let message = "You scored \(points) points" +
                    "\nThe target value is: \(targetValue)" +
                    "\nThe difference is: \(difference)"

        let alert = UIAlertController(
        title: "\(currentValue)",
        message:message,
        preferredStyle: .alert)

        let action = UIAlertAction(
        title: "OK",
        style: .default,
        handler: nil)

        alert.addAction(action)

        present(alert, animated: true, completion: nil)
        startNewRound()

    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound() {
        round += 1
      targetValue = Int.random(in: 1...100)
      currentValue = 50
      slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }



}

