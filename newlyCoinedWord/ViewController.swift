//
//  ViewController.swift
//  newlyCoinedWord
//
//  Created by 박종환 on 2022/07/09.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var exButton1: UIButton!
    @IBOutlet weak var exButton2: UIButton!
    @IBOutlet weak var exButton3: UIButton!
    @IBOutlet weak var exButton4: UIButton!
    
    @IBOutlet weak var upViewTextField: UITextField!
    @IBOutlet weak var upViewButton: UIButton!
    @IBOutlet weak var newlyWordLabel: UILabel!
    let newlyWord: [String] = ["당모치", "너또다", "ㄴㅇㄱ", "내또출", "쪄죽따", "샐러던트", "임플로이언서", "워케이션"]
    let newlyWordAndComments: [String:String] = ["당모치" : "당연히 모든 치킨은 옳다", "너또다" : "너 또 다이어트 하니?", "ㄴㅇㄱ": "상상도 못한 정체!", "내또출" : "내일 또 출근...","쪄죽따" : "쪄 죽어도 따뜻한 아메리카노", "샐러던트" : "공부하는 직장인", "임플로이언서" : "직원이면서 소비자들에게 영향을 주는 사람", "워케이션" : "여행지의 숙박업소에서 쉬면서 일을 하는 것"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upViewDesign(upViewTextField, upViewButton)
        exampleButtonDesign(exButton1, exButton2, exButton3, exButton4)
        exampleButtonListChange(exButton1, exButton2, exButton3, exButton4, newlyWord)
    }
    
    func upViewDesign(_ upViewTextField: UITextField, _ upViewButton: UIButton) {
        upViewTextField.keyboardType = .default
        upViewTextField.borderStyle = .line
        upViewTextField.layer.borderColor = UIColor.black.cgColor
        upViewTextField.layer.borderWidth = 2.0
        
        upViewButton.tintColor = .white
        upViewButton.backgroundColor = .black
        upViewButton.layer.borderColor = UIColor.black.cgColor
        upViewButton.layer.borderWidth = 2.0
    }
    func exampleButtonDesign(_ ex1: UIButton, _ ex2: UIButton, _ ex3: UIButton, _ ex4: UIButton) {
        
        ex1.layer.borderColor = UIColor.black.cgColor
        ex1.layer.borderWidth = 1
        ex1.layer.cornerRadius = 8
        ex1.tintColor = .black
        ex1.titleLabel!.font = .systemFont(ofSize: 10)
        
        ex2.layer.borderColor = UIColor.black.cgColor
        ex2.layer.borderWidth = 1
        ex2.layer.cornerRadius = 8
        ex2.tintColor = .black
    
        ex3.layer.borderColor = UIColor.black.cgColor
        ex3.layer.borderWidth = 1
        ex3.layer.cornerRadius = 8
        ex3.tintColor = .black
        
        ex4.layer.borderColor = UIColor.black.cgColor
        ex4.layer.borderWidth = 1
        ex4.layer.cornerRadius = 8
        ex4.tintColor = .black
    }
    func exampleButtonListChange(_ ex1: UIButton, _ ex2: UIButton, _ ex3: UIButton, _ ex4: UIButton, _ newlyWord: [String]){
        let shuffledArray = newlyWord.shuffled()
        ex1.setTitle(shuffledArray[0], for: .normal)
        ex2.setTitle(shuffledArray[1], for: .normal)
        ex3.setTitle(shuffledArray[2], for: .normal)
        ex4.setTitle(shuffledArray[3], for: .normal)
    }
    @IBAction func searchNewlyWord(_ sender: Any) {
        if(newlyWordAndComments[upViewTextField.text!] == nil) {
            newlyWordLabel.text = "해당 정보를 찾을 수 없습니다."
        } else {
            newlyWordLabel.text = newlyWordAndComments[upViewTextField.text!]
        }
        exampleButtonListChange(exButton1, exButton2, exButton3, exButton4, newlyWord)
        
    }
    @IBAction func returnKeyPressed(_ sender: UITextField) {
        if(newlyWordAndComments[upViewTextField.text!] == nil) {
            newlyWordLabel.text = "해당 정보를 찾을 수 없습니다."
        } else {
            newlyWordLabel.text = newlyWordAndComments[upViewTextField.text!]
        }
        exampleButtonListChange(exButton1, exButton2, exButton3, exButton4, newlyWord)
    }
    @IBAction func tapJesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @IBAction func ex1Clicked(_ sender: UIButton) {
        upViewTextField.text = sender.titleLabel!.text
        searchNewlyWord(upViewButton)
    }
}

