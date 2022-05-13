//
//  ViewController.swift
//  transitiontest
//
//  Created by Thisura Dodangoda on 2022-05-13.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var aButton: UIButton!
    
    private var imageIndex = 0
    
    lazy var strs: [String] = {
        let c: [String] = "hello world this is my last chance at proving my self".components(separatedBy: " ")
        return c
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func getRandomText() -> String{
        let i = Int(arc4random_uniform(UInt32(strs.count)))
        return strs[i]
    }
    
    private func getRandomImage() -> UIImage{
        imageIndex += 1
        if imageIndex.quotientAndRemainder(dividingBy: 2).remainder == 0{
            return UIImage(named: "gem1")!
        }
        else{
            return UIImage(named: "gem2")!
        }
    }

    @IBAction private func animateBtnPressed(){
        /*
        UIView.transition(with: label, duration: 0.3, options: [.curveEaseInOut, .transitionCrossDissolve], animations: {
            self.label.text = self.getRandomText()
        }, completion: nil)

        UIView.transition(with: aButton, duration: 0.3, options: [.curveEaseInOut, .transitionCrossDissolve], animations: {
            self.aButton.setImage(self.getRandomImage(), for: .normal)
        }, completion: nil)
        */
        
        UIView.groupTransition(with: [label, aButton], duration: 0.3, delay: 0.0, type: .moveIn, subtype: nil, timing: .easeInOut) {
            self.label.text = self.getRandomText()
            self.aButton.setImage(self.getRandomImage(), for: .normal)
        } completion: { completed in
            print("Animation dones from VC!", completed ? "completed" : "not completed")
        }
    }

}

