//
//  ViewController.swift
//  RPS
//
//  Created by Canaan Lv on 2018/11/28.
//  Copyright © 2018 Canaan Lv. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 界面初始化调用
        refreshAppUI(.start)
        
    }

    // 插座变量
    @IBOutlet weak var topView: UILabel!
    @IBOutlet weak var systemSign: UIButton!
    @IBOutlet weak var gameStatus: UILabel!
    
    @IBOutlet weak var userSignRock: UIButton!
    @IBOutlet weak var userSignPaper: UIButton!
    @IBOutlet weak var userSignScissiors: UIButton!
    
    @IBOutlet weak var playButton: UIButton!
    
    //响应动作
    @IBAction func tapRockButton(_ sender: UIButton) {
        play(.rock)
    }
    @IBAction func tapPaperButton(_ sender: UIButton) {
        play(.paper)
    }
    @IBAction func tapScissiorsButton(_ sender: UIButton) {
        play(.scissors)
    }
    @IBAction func playAgain(_ sender: UIButton) {
        refreshAppUI(.start)
    }
    
    // 正在游戏中......
    // 定义systemNowSign，nowGameStatus
    // UI更新内容：系统手势，结果手势
    func play(_ userNowSign: Sign) {
        let systemNowSign = randomSign()
        let nowGameStatus = judgeTheStatusOfGame(systemNowSign, userNowSign)
        refreshAppUI(nowGameStatus)
        // 显示系统手势
        switch systemNowSign {
        case .paper:
            systemSign.setTitle("🖐", for: .normal)
        case .rock:
            systemSign.setTitle("👊", for: .normal)
        case .scissors:
            systemSign.setTitle("✌️", for: .normal)
        }
        // 游戏后停用手势按钮
        userSignPaper.isEnabled = false
        userSignRock.isEnabled = false
        userSignScissiors.isEnabled = false
        // 显示用户所选手势
        switch userNowSign {
        case .paper:
            userSignPaper.isHidden = false
            userSignRock.isHidden = true
            userSignScissiors.isHidden = true
        case .rock:
            userSignPaper.isHidden = true
            userSignRock.isHidden = false
            userSignScissiors.isHidden = true
        case .scissors:
            userSignPaper.isHidden = true
            userSignRock.isHidden = true
            userSignScissiors.isHidden = false
        }
        playButton.isHidden = false
    }
    
    // UI更新函数
    // 默认状态：Play Again按钮关闭，其他初始化
    // 其他状态：更新对应回答，隐藏所有用户按钮（play函数中处理）
    func refreshAppUI(_ gameNowStatus: GameState) {
        switch gameNowStatus {
        case .start:
            view.backgroundColor = UIColor.cyan
            systemSign.setTitle("👾", for: .normal)
            userSignRock.isHidden = false
            userSignPaper.isHidden = false
            userSignScissiors.isHidden = false
            userSignPaper.isEnabled = true
            userSignRock.isEnabled = true
            userSignScissiors.isEnabled = true
            playButton.isHidden = true
            topView.text = "CAN YOU WIN?"
            gameStatus.text = "Rock, Paper, Scissors?"
        case .draw:
            view.backgroundColor = UIColor.white
            userSignRock.isHidden = true
            userSignPaper.isHidden = true
            userSignScissiors.isHidden = true
            playButton.isHidden = true
            topView.text = "Nice Try!"
            gameStatus.text = "DRAW"
        case .lose:
            view.backgroundColor = UIColor.green
            userSignRock.isHidden = true
            userSignPaper.isHidden = true
            userSignScissiors.isHidden = true
            playButton.isHidden = true
            topView.text = "Come on! Don't give up."
            gameStatus.text = "LOSE"
        case .win:
            view.backgroundColor = UIColor.yellow
            userSignRock.isHidden = true
            userSignPaper.isHidden = true
            userSignScissiors.isHidden = true
            playButton.isHidden = true
            topView.text = "Congratulations!"
            gameStatus.text = "WIN"
        }
    }
}

