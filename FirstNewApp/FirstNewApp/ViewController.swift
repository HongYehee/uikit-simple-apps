//
//  ViewController.swift
//  FirstNewApp
//
//  Created by 홍예희 on 6/12/25.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    weak var timer: Timer?
    var number: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // viewDidLoad에 들어갈 함수
    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
    }

    
    // 슬라이더의 값을 가지고 메인 레이블의 텍스트와 number 세팅
    @IBAction func sliderChanged(_ sender: UISlider) {
        let seconds = Int(slider.value * 60)
        mainLabel.text = "\(seconds)초"
        number = seconds
    }
    
    // 1초씩 지나갈 때마다 무언가를 실행
    @IBAction func startButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [self] _ in
            // 반복을 하고 싶은 코드 : 1초 줄이고, 슬라이더도 줄이고, 레이블도 다시 표시, 0이 됐을 때 소리 재생
            if number > 0 {
                number -= 1
                slider.setValue(Float(number) / Float(60), animated: true)
                mainLabel.text = "\(number)초"
            } else {
                number = 0
                mainLabel.text = "초를 선택하세요"
                timer?.invalidate() // 타이머 비활성화
                AudioServicesPlayAlertSound(SystemSoundID(1322)) // 소리 재생
            }
        })
    }
    
    // 초기화 세팅
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        mainLabel.text = "초를 선택하세요"
        slider.setValue(0.5, animated: true)
        number = 0
        timer?.invalidate()
    }
    
}

