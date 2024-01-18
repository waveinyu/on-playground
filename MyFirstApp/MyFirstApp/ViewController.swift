//
//  ViewController.swift
//  MyFirstApp
//
//  Created by 유영 on 1/17/24.
//

import UIKit

// 화면 하나 당 관리하는 코드
class ViewController: UIViewController {
    
    @IBOutlet weak var mainLable: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func pressedButton(_ sender: UIButton) {
        
        /*
         mainLabel.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
         */
        
        mainLable.text = "월드"
        mainLable.backgroundColor = UIColor.gray
        mainLable.textColor = UIColor.white
                
        
    }
    
}
 
