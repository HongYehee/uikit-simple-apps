//
//  ViewController.swift
//  RPSGame
//
//  Created by 홍예희 on 6/4/25.
//

import UIKit

class ViewController: UIViewController {
    // 변수 (속성)
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
    var myChoice: Rps = Rps.rock
    
    
    // 함수 (메서드)
    // viewDidLoad() : 앱 화면에 들어오면 처음 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // 첫 번째, 두 번째 이미지뷰에 준비 이미지(주먹) 띄우기
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = UIImage(named: "ready.png")
        
        // 첫 번째, 두 번째 레이블에 준비 문자열 띄우기
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
    }

    
    // 가위 바위 보를 선택하고 그 정보를 저장
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        // 버튼의 문자열 가져오기
        // guard let title = sender.currentTitle else { return }
        let title = sender.currentTitle!
        
        // 열거형으로 만들어서 저장
        switch title {
        case "가위":
            myChoice = Rps.scissors
        case "바위":
            myChoice = Rps.rock
        case "보":
            myChoice = Rps.paper
        default:
            break
        }
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // 컴퓨터가 랜덤으로 선택한 것을 이미지뷰, 레이블에 표시
        switch comChoice {
        case Rps.rock:
            comImageView.image = #imageLiteral(resourceName: "rock")
            comChoiceLabel.text = "바위"
        case Rps.paper:
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "보"
        case Rps.scissors:
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "가위"
        }
        
        // 내가 선택한 것을 이미지뷰, 레이블에 표시
        switch myChoice {
        case Rps.rock:
            myImageView.image = #imageLiteral(resourceName: "rock")
            myChoiceLabel.text = "바위"
        case Rps.paper:
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "보"
        case Rps.scissors:
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "가위"
        }
        
        // 컴퓨터가 선택한 것과 내가 선택한 것을 비교해서 승패 판단 후 표시
        if comChoice == myChoice {
            mainLabel.text = "비겼다"
        } else if comChoice == .rock && myChoice == .paper {
            mainLabel.text = "이겼다"
        } else if comChoice == .paper && myChoice == .scissors {
            mainLabel.text = "이겼다"
        } else if comChoice == .scissors && myChoice == .rock {
            mainLabel.text = "이겼다"
        } else {
            mainLabel.text = "졌다"
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 컴퓨터 이미지뷰, 레이블에 준비 표시
        comImageView.image = #imageLiteral(resourceName: "ready")
        comChoiceLabel.text = "준비"
        
        // 내 이미지뷰, 레이블에 준비 이미지 표시
        myImageView.image = #imageLiteral(resourceName: "ready")
        myChoiceLabel.text = "준비"
        
        // 메인 레이블에 선택하세요 표시
        mainLabel.text = "선택하세요"
        
        // 컴퓨터가 다시 랜덤 가위바위보 선택 후 저장
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
    }
    
}
