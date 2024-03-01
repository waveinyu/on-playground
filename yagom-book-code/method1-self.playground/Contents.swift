import UIKit

var greeting = "Hello, playground"

// self는 주로
// 1. 인스턴스 자체를 새로운 값으로 대체하거나
// 2. 현재 인스턴스를 다른 메서드에 전달할 때 유용
struct LevelStruct {
    var level: Int = 0
    
    mutating func levelUp() {
        print("Level Up!")
        level += 1 // self += 1 은 타입 불일치로 인한 불가능한 연산(LevelStruct 타입에 Int 타입을 더겠다는 소리)
    }
    
    mutating func reset() {
        print("Reset!")
        self = LevelStruct() // 현재의 LevelStruct 인스턴스를 완전히 새로운 LevelStruct 인스턴스로 대체하겠다는 소리
    }
    
}

var levelStructInstance: LevelStruct = LevelStruct()
levelStructInstance.levelUp()
print(levelStructInstance.level)

levelStructInstance.reset()
print(levelStructInstance.level)
