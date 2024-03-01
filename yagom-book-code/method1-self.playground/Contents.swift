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

// :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

/* 인스턴스를 함수처럼 호출하도록 하는 메서드 
 구조체에 callAsFunction 메서드 구현
 */

// callAsFunction: 메서드를 호출하는 것 외에, 함수 표현으로는 사용할 수 없다.
// let function: (String) -> Void = doggy(destination:) -- XXXX 안 됨
// let function: (String) -> Void = doggy.callAsFunction(destination:) -- OOOO 가능
struct Puppy {
    var name: String = "멍멍이"
    
    func callAsFunction() {
        print("멍멍")
    }
    
    func callAsFunction(destination: String) {
        print("\(destination)으로 걸어갑니다")
    }
    
    func callAsFunction(something: String, times: Int) {
        print("\(something)를 \(times)번 반복합니다")
    }
    
    func callAsFunction(color: String) -> String {
        return "\(color) 응가"
    }
    
    // 해당 메서드가 인스턴스 내부의 값을 변경하겠다는 뜻
    // mutating 키워드가 오면 속성 값의 변경이 있다는 거
    mutating func callAsFunction(name: String) {
        self.name = name
    }
}

var doggy: Puppy = Puppy()

// 두 코드는 완전히 같은 표현이다.
doggy.callAsFunction() // 멍멍
doggy() // 멍멍

doggy.callAsFunction(destination: "집")
doggy(destination: "우리집")
doggy(something: "짖기", times: 100)

print(doggy(color: "무지개색"))

doggy(name: "댕댕이")
print(doggy.name)

