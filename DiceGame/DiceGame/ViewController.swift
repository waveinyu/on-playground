//
//  ViewController.swift
//  DiceGame
//
//  Created by 유영 on 2/7/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    var diceArray: [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        firstImageView.image = diceArray.randomElement()
        secondImageView.image = diceArray.randomElement()
        
        if firstImageView.image == secondImageView.image {
            print("잭팟!")
        } else {
            print("꽝!")
        }
    }
}

