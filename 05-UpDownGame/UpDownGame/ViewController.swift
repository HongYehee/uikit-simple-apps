//
//  ViewController.swift
//  UpDownGame
//
//  Created by 홍예희 on 6/5/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    // 컴퓨터가 1~10 중 랜덤 숫자 선택
    var comNumber = Int.random(in: 1...10)
    
    // 내가 선택한 숫자 (버튼 중 0이 없어서 1로 설정하고 시작)
    // var myNumber = 1
    
    
    // 앱의 화면에 들어오면 가장 처음에 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 메인 레이블에 "선택하세요"
        mainLabel.text = "선택하세요"
        
        // 숫자 레이블에 "" (빈 문자열)
        numberLabel.text = ""
    }


    @IBAction func buttonTapped(_ sender: UIButton) {
        // 버튼의 숫자 가져오기
        guard let numString = sender.currentTitle else { return }
        
        // 숫자 레이블이 숫자에 따라 변하도록 하기
        numberLabel.text = numString
        
        // 선택한 숫자를 변수에 저장하기 (선택)
        // guard let num = Int(numString) else { return }
        // myNumber = num
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // 또 다른 방법 - 숫자 레이블에 있는 문자열 가져와서 정수로 타입 변환
        guard let myNumString = numberLabel.text else { return }
        guard let myNumber = Int(myNumString) else { return }
        
        // 컴퓨터의 숫자와 내가 선택한 숫자를 비교해서 메인 레이블에 up/down/bingo 표시
         if comNumber > myNumber {
             mainLabel.text = "Up 👆"
         } else if comNumber < myNumber {
             mainLabel.text = "Down 👇"
         } else {
             mainLabel.text = "Bingo 🎉"
         }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 메인 레이블 "선택하세요"
        mainLabel.text = "선택하세요"
        
        // 숫자 레이블 ""
        numberLabel.text = ""
        
        // 컴퓨터의 랜덤 숫자 다시 선택
        comNumber = Int.random(in: 1...10)
    }
    
}

