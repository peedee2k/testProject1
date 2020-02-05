//
//  ViewController.swift
//  testProject
//
//  Created by Pankaj Sharma on 4/5/17.
//  Copyright © 2017 Pankaj Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var square1: UIButton!
    @IBOutlet weak var square2: UIButton!
    @IBOutlet weak var square3: UIButton!
    @IBOutlet weak var square4: UIButton!
    @IBOutlet weak var square5: UIButton!
    @IBOutlet weak var square6: UIButton!
    @IBOutlet weak var square7: UIButton!
    @IBOutlet weak var square8: UIButton!
    @IBOutlet weak var square9: UIButton!
    @IBOutlet weak var square10: UIButton!
   
    @IBOutlet weak var rect1: UIButton!
    @IBOutlet weak var rect2: UIButton!
    @IBOutlet weak var rect3: UIButton!
    @IBOutlet weak var rect4: UIButton!
    @IBOutlet weak var rect5: UIButton!
    @IBOutlet weak var rect6: UIButton!
    @IBOutlet weak var rect7: UIButton!
    @IBOutlet weak var rect8: UIButton!
    @IBOutlet weak var rect9: UIButton!
    @IBOutlet weak var rect10: UIButton!
    @IBOutlet weak var rect11: UIButton!
    @IBOutlet weak var rect12: UIButton!
    @IBOutlet weak var rect13: UIButton!
    @IBOutlet weak var rect14: UIButton!
    @IBOutlet weak var rect15: UIButton!
    @IBOutlet weak var rect16: UIButton!
    @IBOutlet weak var rect17: UIButton!
    @IBOutlet weak var rect18: UIButton!
    @IBOutlet weak var rect19: UIButton!
    @IBOutlet weak var rect20: UIButton!
    
    @IBOutlet weak var circle1: UIButton!
    @IBOutlet weak var circle2: UIButton!
    @IBOutlet weak var circle3: UIButton!
    @IBOutlet weak var circle4: UIButton!
    @IBOutlet weak var circle5: UIButton!
    @IBOutlet weak var circle6: UIButton!
    @IBOutlet weak var circle7: UIButton!
    @IBOutlet weak var circle8: UIButton!
    @IBOutlet weak var circle9: UIButton!
    @IBOutlet weak var circle10: UIButton!
    @IBOutlet weak var circle11: UIButton!
    @IBOutlet weak var circle12: UIButton!
    @IBOutlet weak var circle13: UIButton!
    @IBOutlet weak var circle14: UIButton!
    @IBOutlet weak var circle15: UIButton!
    @IBOutlet weak var circle16: UIButton!
    @IBOutlet weak var circle17: UIButton!
    @IBOutlet weak var circle18: UIButton!
    @IBOutlet weak var circle19: UIButton!
    @IBOutlet weak var circle20: UIButton!
   
    let picker = UIPickerView()
    let signArray = ["+", "-"]
    var total:Int = 0
    @IBOutlet weak var yourAnswer: UITextField!
    @IBOutlet weak var signTextField: UITextField!
    
    @IBOutlet weak var AutoanswerLabel: UILabel!
    @IBOutlet weak var messsageLabel: UILabel!
    @IBOutlet weak var smallView: UIView!
    @IBOutlet weak var viewShowhideBtn: UIButton!
    @IBOutlet weak var randomNum1: UILabel!
    @IBOutlet weak var randomNum2: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatDoneButton()
        picker.dataSource = self
        picker.delegate = self
        signTextField.inputView = picker
        smallView.layer.cornerRadius = 15
        smallView.layer.masksToBounds = true
        randomNumber()
        
    }
    
    func changeImage(button: UIButton, unchecked: UIImage, checked: UIImage) {
       
        if button.currentImage == checked {
            button.setImage(unchecked, for: .normal)
        } else {
            button.setImage(checked, for: .normal)
        }
    }

    //Done button
    func creatDoneButton() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonPressd))
        toolbar.setItems([doneButton], animated: false)
        
        signTextField.inputAccessoryView = toolbar
        yourAnswer.inputAccessoryView = toolbar
        
        
    }
    @objc func doneButtonPressd() {
        self.view.endEditing(true)
        
    }
    //PickerView
    
    //PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return signArray.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        signTextField.text = signArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return signArray[row]
    }
    
        // result of two numbers
    @IBAction func checkAnswerBtnPressed(_ sender: UIButton) {
/*
        let number1 = Int(self.number1.text!)
        let number2 = Int(self.number2.text!)
        
        if number1 != nil && number2 != nil && signTextField.text != "" {
            if signTextField.text == "+" {
                total = number1! + number2!
            } else if signTextField.text == "-" {
                total = number1! - number2!
            }
            
            // AutoanswerLabel.isHidden = false
            AutoanswerLabel.text = "\(total)"
*/
           // randomNumber()
            getCorrectAnswer()
            if yourAnswer.text == AutoanswerLabel.text {
            messsageLabel.isHidden = false
            messsageLabel.text = "Awesome! You are doing great"
            AutoanswerLabel.isHidden = false
            AutoanswerLabel.text = "\(total)"
            } else if yourAnswer.text == "" {
            messsageLabel.isHidden = false
            messsageLabel.text = "Please write your answer"
        }   else if yourAnswer.text != AutoanswerLabel.text {
            messsageLabel.isHidden = false
            messsageLabel.text = "Please try again"
            AutoanswerLabel.isHidden = true
        
        } else {
            messsageLabel.isHidden = false
            messsageLabel.text = "Oops Something is missing"
            messsageLabel.textColor = UIColor.red
        }
    }
    
    //show and hide small view
    @IBAction func viewHideShowBtn(_ sender: UIButton) {
        if sender.titleLabel?.text == "Click here to count" {
            UIView.animate(withDuration: 0.3, animations: {
             self.smallView.isHidden = false })
            sender.setTitle("Click here to hide", for: .normal)
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.smallView.isHidden = true})
            sender.setTitle("Click here to count", for: .normal)
            
           //Change checked buttons to clear buttons
            square1.setImage(#imageLiteral(resourceName: "squreWhite"), for: .normal)
            square2.setImage(#imageLiteral(resourceName: "squreWhite"), for: .normal)
            square3.setImage(#imageLiteral(resourceName: "squreWhite"), for: .normal)
            square4.setImage(#imageLiteral(resourceName: "squreWhite"), for: .normal)
            square5.setImage(#imageLiteral(resourceName: "squreWhite"), for: .normal)
            square6.setImage(#imageLiteral(resourceName: "squreWhite"), for: .normal)
            square7.setImage(#imageLiteral(resourceName: "squreWhite"), for: .normal)
            square8.setImage(#imageLiteral(resourceName: "squreWhite"), for: .normal)
            square9.setImage(#imageLiteral(resourceName: "squreWhite"), for: .normal)
            square10.setImage(#imageLiteral(resourceName: "squreWhite"), for: .normal)
            
            rect1.setImage(#imageLiteral(resourceName: "rectWhite"), for: .normal)
            rect2.setImage(#imageLiteral(resourceName: "rectWhite"), for: .normal)
            rect3.setImage(#imageLiteral(resourceName: "rectWhite"), for: .normal)
            rect4.setImage(#imageLiteral(resourceName: "rectWhite"), for: .normal)
            rect5.setImage(#imageLiteral(resourceName: "rectWhite"), for: .normal)
            rect6.setImage(#imageLiteral(resourceName: "rectWhite"), for: .normal)
            rect7.setImage(#imageLiteral(resourceName: "rectWhite"), for: .normal)
            rect8.setImage(#imageLiteral(resourceName: "rectWhite"), for: .normal)
            rect9.setImage(#imageLiteral(resourceName: "rectWhite"), for: .normal)
            rect10.setImage(#imageLiteral(resourceName: "rectWhite"), for: .normal)
            rect11.setImage(#imageLiteral(resourceName: "rectWhite"), for: .normal)
            rect12.setImage(#imageLiteral(resourceName: "rectWhite"), for: .normal)
            rect13.setImage(#imageLiteral(resourceName: "rectWhite"), for: .normal)
            rect14.setImage(#imageLiteral(resourceName: "rectWhite"), for: .normal)
            rect15.setImage(#imageLiteral(resourceName: "rectWhite"), for: .normal)
            rect16.setImage(#imageLiteral(resourceName: "rectWhite"), for: .normal)
            rect17.setImage(#imageLiteral(resourceName: "rectWhite"), for: .normal)
            rect18.setImage(#imageLiteral(resourceName: "rectWhite"), for: .normal)
            rect19.setImage(#imageLiteral(resourceName: "rectWhite"), for: .normal)
            rect20.setImage(#imageLiteral(resourceName: "rectWhite"), for: .normal)
        
            circle1.setImage(#imageLiteral(resourceName: "clearCircle"), for: .normal)
            circle2.setImage(#imageLiteral(resourceName: "clearCircle"), for: .normal)
            circle3.setImage(#imageLiteral(resourceName: "clearCircle"), for: .normal)
            circle4.setImage(#imageLiteral(resourceName: "clearCircle"), for: .normal)
            circle5.setImage(#imageLiteral(resourceName: "clearCircle"), for: .normal)
            circle6.setImage(#imageLiteral(resourceName: "clearCircle"), for: .normal)
            circle7.setImage(#imageLiteral(resourceName: "clearCircle"), for: .normal)
            circle8.setImage(#imageLiteral(resourceName: "clearCircle"), for: .normal)
            circle9.setImage(#imageLiteral(resourceName: "clearCircle"), for: .normal)
            circle10.setImage(#imageLiteral(resourceName: "clearCircle"), for: .normal)
            circle11.setImage(#imageLiteral(resourceName: "clearCircle"), for: .normal)
            circle12.setImage(#imageLiteral(resourceName: "clearCircle"), for: .normal)
            circle13.setImage(#imageLiteral(resourceName: "clearCircle"), for: .normal)
            circle14.setImage(#imageLiteral(resourceName: "clearCircle"), for: .normal)
            circle15.setImage(#imageLiteral(resourceName: "clearCircle"), for: .normal)
            circle16.setImage(#imageLiteral(resourceName: "clearCircle"), for: .normal)
            circle17.setImage(#imageLiteral(resourceName: "clearCircle"), for: .normal)
            circle18.setImage(#imageLiteral(resourceName: "clearCircle"), for: .normal)
            circle19.setImage(#imageLiteral(resourceName: "clearCircle"), for: .normal)
            circle20.setImage(#imageLiteral(resourceName: "clearCircle"), for: .normal)
        }
    }
    @IBAction func squre1Pressed(_ sender: UIButton) {
        changeImage(button:square1 , unchecked: #imageLiteral(resourceName: "squreWhite"), checked: #imageLiteral(resourceName: "SqureX"))}
    @IBAction func square2Pressed(_ sender: UIButton) {
        changeImage(button: square2, unchecked: #imageLiteral(resourceName: "squreWhite"), checked: #imageLiteral(resourceName: "SqureX"))}
    @IBAction func square3pressed(_ sender: UIButton) {
        changeImage(button: square3, unchecked: #imageLiteral(resourceName: "squreWhite"), checked: #imageLiteral(resourceName: "SqureX"))}
    @IBAction func square4(_ sender: UIButton) {
        changeImage(button: square4, unchecked: #imageLiteral(resourceName: "squreWhite"), checked: #imageLiteral(resourceName: "SqureX"))}
    @IBAction func square5(_ sender: UIButton) {
        changeImage(button: square5, unchecked: #imageLiteral(resourceName: "squreWhite"), checked: #imageLiteral(resourceName: "SqureX"))}
    @IBAction func square6Pressed(_ sender: UIButton) {
        changeImage(button: square6, unchecked: #imageLiteral(resourceName: "squreWhite"), checked: #imageLiteral(resourceName: "SqureX"))}
    @IBAction func square7Pressed(_ sender: UIButton) {
        changeImage(button: square7, unchecked: #imageLiteral(resourceName: "squreWhite"), checked: #imageLiteral(resourceName: "SqureX"))}
    @IBAction func square8Pressed(_ sender: UIButton) {
        changeImage(button: square8, unchecked: #imageLiteral(resourceName: "squreWhite"), checked: #imageLiteral(resourceName: "SqureX"))}
    @IBAction func square9Pressed(_ sender: UIButton) {
        changeImage(button: square9, unchecked: #imageLiteral(resourceName: "squreWhite"), checked: #imageLiteral(resourceName: "SqureX"))}
    @IBAction func square10Pressed(_ sender: UIButton) {
        changeImage(button: square10, unchecked: #imageLiteral(resourceName: "squreWhite"), checked: #imageLiteral(resourceName: "SqureX"))}
    //Rectangle (Tens) Pressed
    
    @IBAction func rect1Pressed(_ sender: UIButton) {
    changeImage(button: rect1, unchecked: #imageLiteral(resourceName: "rectWhite"), checked: #imageLiteral(resourceName: "rectX"))}
    @IBAction func rect2Pressed(_ sender: UIButton) {
    changeImage(button: rect2, unchecked: #imageLiteral(resourceName: "rectWhite"), checked: #imageLiteral(resourceName: "rectX"))}
    @IBAction func rect3Pressed(_ sender: UIButton) {
    changeImage(button: rect3, unchecked: #imageLiteral(resourceName: "rectWhite"), checked: #imageLiteral(resourceName: "rectX"))}
    @IBAction func rect4Pressed(_ sender: UIButton) {
    changeImage(button: rect4, unchecked: #imageLiteral(resourceName: "rectWhite"), checked: #imageLiteral(resourceName: "rectX"))}
    @IBAction func rect5Pressed(_ sender: UIButton) {
    changeImage(button: rect5, unchecked: #imageLiteral(resourceName: "rectWhite"), checked: #imageLiteral(resourceName: "rectX"))}
    @IBAction func rect6Pressed(_ sender: UIButton) {
    changeImage(button: rect6, unchecked: #imageLiteral(resourceName: "rectWhite"), checked: #imageLiteral(resourceName: "rectX"))}
    @IBAction func rect7Pressed(_ sender: UIButton) {
    changeImage(button: rect7, unchecked: #imageLiteral(resourceName: "rectWhite"), checked: #imageLiteral(resourceName: "rectX"))}
    @IBAction func rect8Pressed(_ sender: UIButton) {
    changeImage(button: rect8, unchecked: #imageLiteral(resourceName: "rectWhite"), checked: #imageLiteral(resourceName: "rectX"))}
    @IBAction func rect9Pressed(_ sender: UIButton) {
    changeImage(button: rect9, unchecked: #imageLiteral(resourceName: "rectWhite"), checked: #imageLiteral(resourceName: "rectX"))}
    @IBAction func rect10Pressed(_ sender: UIButton) {
    changeImage(button: rect10, unchecked: #imageLiteral(resourceName: "rectWhite"), checked: #imageLiteral(resourceName: "rectX"))}
    
    @IBAction func rect11Pressed(_ sender: UIButton) {
    changeImage(button: rect11, unchecked: #imageLiteral(resourceName: "rectWhite"), checked: #imageLiteral(resourceName: "rectX"))}
    @IBAction func rect12Pressed(_ sender: UIButton) {
    changeImage(button: rect12, unchecked: #imageLiteral(resourceName: "rectWhite"), checked: #imageLiteral(resourceName: "rectX"))}
    @IBAction func rect13Pressed(_ sender: UIButton) {
    changeImage(button: rect13, unchecked: #imageLiteral(resourceName: "rectWhite"), checked: #imageLiteral(resourceName: "rectX"))}
    @IBAction func rect14Pressed(_ sender: UIButton) {
    changeImage(button: rect14, unchecked: #imageLiteral(resourceName: "rectWhite"), checked: #imageLiteral(resourceName: "rectX"))}
    @IBAction func rect15Pressed(_ sender: UIButton) {
    changeImage(button: rect15, unchecked: #imageLiteral(resourceName: "rectWhite"), checked: #imageLiteral(resourceName: "rectX"))}
    @IBAction func rect16Pressed(_ sender: UIButton) {
    changeImage(button: rect16, unchecked: #imageLiteral(resourceName: "rectWhite"), checked: #imageLiteral(resourceName: "rectX"))}
    @IBAction func rect17Pressed(_ sender: UIButton) {
    changeImage(button: rect17, unchecked: #imageLiteral(resourceName: "rectWhite"), checked: #imageLiteral(resourceName: "rectX"))}
    @IBAction func rect18Pressed(_ sender: UIButton) {
    changeImage(button: rect18, unchecked: #imageLiteral(resourceName: "rectWhite"), checked: #imageLiteral(resourceName: "rectX"))}
    @IBAction func rect19Pressed(_ sender: UIButton) {
    changeImage(button: rect19, unchecked: #imageLiteral(resourceName: "rectWhite"), checked: #imageLiteral(resourceName: "rectX"))}
    @IBAction func rect20Pressed(_ sender: UIButton) {
    changeImage(button: rect20, unchecked: #imageLiteral(resourceName: "rectWhite"), checked: #imageLiteral(resourceName: "rectX"))}
    //Circle(Ones) Pressed
    
    @IBAction func circle1Pressed(_ sender: UIButton) {
    changeImage(button: circle1, unchecked: #imageLiteral(resourceName: "clearCircle"), checked: #imageLiteral(resourceName: "roundX"))}
    @IBAction func circle2Pressed(_ sender: UIButton) {
    changeImage(button: circle2, unchecked: #imageLiteral(resourceName: "clearCircle"), checked: #imageLiteral(resourceName: "roundX"))}
    @IBAction func circle3Pressed(_ sender: UIButton) {
    changeImage(button: circle3, unchecked: #imageLiteral(resourceName: "clearCircle"), checked: #imageLiteral(resourceName: "roundX"))}
 @IBAction func circle4Pressed(_ sender: UIButton) {
    changeImage(button: circle4, unchecked: #imageLiteral(resourceName: "clearCircle"), checked: #imageLiteral(resourceName: "roundX"))}
    @IBAction func circle5Pressed(_ sender: UIButton) {
   changeImage(button: circle5, unchecked: #imageLiteral(resourceName: "clearCircle"), checked: #imageLiteral(resourceName: "roundX")) }
   @IBAction func circle6Pressed(_ sender: UIButton) {
    changeImage(button: circle6, unchecked: #imageLiteral(resourceName: "clearCircle"), checked: #imageLiteral(resourceName: "roundX"))}
    @IBAction func circle7Pressed(_ sender: UIButton) {
    changeImage(button: circle7, unchecked: #imageLiteral(resourceName: "clearCircle"), checked: #imageLiteral(resourceName: "roundX"))}
    @IBAction func circle8Pressed(_ sender: UIButton) {
   changeImage(button: circle8, unchecked: #imageLiteral(resourceName: "clearCircle"), checked: #imageLiteral(resourceName: "roundX")) }
    @IBAction func circle9Pressed(_ sender: UIButton) {
   changeImage(button: circle9, unchecked: #imageLiteral(resourceName: "clearCircle"), checked: #imageLiteral(resourceName: "roundX")) }
    @IBAction func circle10Pressed(_ sender: UIButton) {
   changeImage(button: circle10, unchecked: #imageLiteral(resourceName: "clearCircle"), checked: #imageLiteral(resourceName: "roundX")) }
    @IBAction func circle11Pressed(_ sender: UIButton) {
   changeImage(button: circle11, unchecked: #imageLiteral(resourceName: "clearCircle"), checked: #imageLiteral(resourceName: "roundX")) }
    @IBAction func circle12Pressed(_ sender: UIButton) {
    changeImage(button: circle12, unchecked: #imageLiteral(resourceName: "clearCircle"), checked: #imageLiteral(resourceName: "roundX"))}
    @IBAction func circle13Pressed(_ sender: UIButton) {
    changeImage(button: circle13, unchecked: #imageLiteral(resourceName: "clearCircle"), checked: #imageLiteral(resourceName: "roundX"))}
    @IBAction func circle14Pressed(_ sender: UIButton) {
    changeImage(button: circle14, unchecked: #imageLiteral(resourceName: "clearCircle"), checked: #imageLiteral(resourceName: "roundX"))}
    @IBAction func circle15Pressed(_ sender: UIButton) {
    changeImage(button: circle15, unchecked: #imageLiteral(resourceName: "clearCircle"), checked: #imageLiteral(resourceName: "roundX"))}
    @IBAction func circle16Pressed(_ sender: UIButton) {
    changeImage(button: circle16, unchecked: #imageLiteral(resourceName: "clearCircle"), checked: #imageLiteral(resourceName: "roundX"))}
    @IBAction func circle17Pressed(_ sender: UIButton) {
    changeImage(button: circle17, unchecked: #imageLiteral(resourceName: "clearCircle"), checked: #imageLiteral(resourceName: "roundX"))}
    @IBAction func circle18Pressed(_ sender: UIButton) {
   changeImage(button: circle18, unchecked: #imageLiteral(resourceName: "clearCircle"), checked: #imageLiteral(resourceName: "roundX")) }
    @IBAction func circle19Pressed(_ sender: UIButton) {
    changeImage(button: circle19, unchecked: #imageLiteral(resourceName: "clearCircle"), checked: #imageLiteral(resourceName: "roundX"))}
    @IBAction func circle20Pressed(_ sender: UIButton) {
   changeImage(button: circle20, unchecked: #imageLiteral(resourceName: "clearCircle"), checked: #imageLiteral(resourceName: "roundX")) }
    
    
    
    
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        randomNumber()
        
        signTextField.text = ""
        yourAnswer.text = nil
        messsageLabel.isHidden = true
        AutoanswerLabel.isHidden = true
        //viewHideShowBtn(viewShowhideBtn)
        smallView.isHidden = true
        viewShowhideBtn.setTitle("Click here to count", for: .normal)
        
        }
    
    //Create Random Number
    func randomNumber() {
        let ranNum1 = arc4random_uniform(UInt32(Int32(400) + Int32(100)))
        let ranNum2 = arc4random_uniform(UInt32(Int32(400) + Int32(100)))
        let minNum = min(ranNum1, ranNum2)
        let maxNum = max(ranNum1, ranNum2)
        randomNum1.text = String(maxNum)
        randomNum2.text = String(minNum)
    }
    //Get Correct Answer 
    func getCorrectAnswer() {
        if signTextField.text == "+" {
            total = Int(randomNum1.text!)! + Int(randomNum2.text!)!
            AutoanswerLabel.text = "\(total)"
        } else if signTextField.text == "-" {
            total = Int(randomNum1.text!)! - Int(randomNum2.text!)!
            AutoanswerLabel.text = "\(total)"
        }
    }
    

  }

