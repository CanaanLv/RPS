//
//  GameState.swift
//  RPS
//
//  Created by Canaan Lv on 2018/11/28.
//  Copyright © 2018 Canaan Lv. All rights reserved.
//

import Foundation

// 枚举所有游戏状态
enum GameState: String {
    case start
    case lose
    case win
    case draw
}

// 判断游戏结果
// 输入系统和用户手势后比较，返回游戏状态值
func judgeTheStatusOfGame(_ theSystemSign: Sign, _ theUserSign: Sign) -> GameState {
    switch theSystemSign {
    case .paper:
        switch theUserSign {
        case .paper:
            return GameState.draw
        case .rock:
            return GameState.lose
        case .scissors:
            return GameState.win
        }
    case .rock:
        switch theUserSign {
        case .paper:
            return GameState.win
        case .rock:
            return GameState.draw
        case .scissors:
            return GameState.lose
        }
    case .scissors:
        switch theUserSign {
        case .paper:
            return GameState.lose
        case .rock:
            return GameState.win
        case .scissors:
            return GameState.draw
        }
    }
}
