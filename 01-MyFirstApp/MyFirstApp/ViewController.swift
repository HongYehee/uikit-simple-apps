//
//  ViewController.swift
//  MyFirstApp
//
//  Created by 홍예희 on 5/29/25.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlet: 변수 (속성 변경 가능)
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    
    // viewDidLoad: 앱의 화면에 들어오면 처음 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = "반갑습니다 🤓"
        mainLabel.backgroundColor = UIColor.yellow
    }
    
    // Action: 버튼을 누르면 실행되는 함수
    @IBAction func buttonPressed(_ sender: UIButton) {
        mainLabel.text = "안녕하세요 👋"
        mainLabel.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1) // #colorLiteral(
        mainLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        mainLabel.textAlignment = NSTextAlignment.right
        
        myButton.backgroundColor = UIColor.yellow
        myButton.setTitleColor(UIColor.black, for: UIControl.State.normal) // 함수임
    }

}

