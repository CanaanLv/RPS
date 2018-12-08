//
//  Sign.swift
//  RPS
//
//  Created by Canaan Lv on 2018/11/28.
//  Copyright © 2018 Canaan Lv. All rights reserved.
//

import Foundation
import GameplayKit

// 生成随机系统手势
// 调用函数生成随机手势
let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

// 枚举所有手势
enum Sign: String {
    case rock
    case paper
    case scissors
}
