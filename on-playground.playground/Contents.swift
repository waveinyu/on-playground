import UIKit


// 가위바위보 (if문)
var com: Int = Int.random(in: 0...2)

/**
 player도 랜덤일 경우
var player: Int = Int.random(in: 0...2)
if player == com {
    print("무승부입니다.")
} else if player > com {
    print("당신은 이겼습니다.")
} else {
    print("당신은 졌습니다.")
}
*/

var player: Int = 0
if player == 0 {
    if player == com {
        print("무승부입니다.")
    } else if player > com {
        print("당신은 이겼습니다.")
    } else {
        print("당신은 졌습니다.")
    }
} else if player == 1 {
    if player == com {
        print("무승부입니다.")
    } else if player > com {
        print("당신은 이겼습니다.")
    } else {
        print("당신은 졌습니다.")
    }
} else {
    if player == com {
        print("무승부입니다.")
    } else if player > com {
        print("당신은 이겼습니다.")
    } else {
        print("당신은 졌습니다.")
    }
}



// 랜덤 빙고 게임
var comChoice: Int = Int.random(in: 1...10)
var myChoice: Int = 10

if myChoice == comChoice {
    print("Bingo")
} else if myChoice > comChoice {
    print("Down")
} else {
    print("Up")
}
