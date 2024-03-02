import UIKit

var greeting = "Hello, playground"

// initalizer
/* 클래스, 구조체, 열거형의 기본적인 형태의 이니셜라이저 */
class SomeClass {
    init() {
        // 초기화할 때 필요한 코드
    }
}

struct SomeStruct {
    init() {
        // 초기화할 때 필요한 코드
    }
}

enum SomeEnum {
    case someCase
    
    init() {
        // 열거형은 초기화할 때 반드시 case 중 하나가 되어야 한다
        // 초기화할 때 필요한 코드
        self = .someCase
    }
}

// 프로퍼티 기본값
/* Area 구초제와 이니셜라이저 */
// 1. 이니셜라이저로 저장 프로퍼티에 초깃값을 설정하는 방식
struct Area {
    var squareMeter: Double
    
    init() {
        squareMeter = 0.0 // squareMeter의 초깃값을 할당
    }
}

let room: Area = Area()
print(room.squareMeter)

// 2. 프로퍼티를 정의할 때 프로퍼티에 기본값을 할당하는 방식
struct Area2 {
    var squareMeter: Double = 0.0
}

let room2: Area2 = Area2()
print(room.squareMeter) // 0.0


// 이니셜라이저 매개변수
struct Area3 {
    var squareMeter: Double
    
    // 첫 번째 이니셜라이저
    init(fromPy py: Double) {
        squareMeter = py * 3.3058
    }
    
    // 두 번째 이니셜라이저
    init(fromSquareMeter squareMeter: Double) {
        self.squareMeter = squareMeter
    }
    
    // 세 번째 이니셜라이저
    init(value: Double) {
        squareMeter = value
    }
    
    // 네 번째 이니셜라이저
    init(_ value: Double) {
        squareMeter = value
    }
}

let roomOne: Area3 = Area3(fromPy: 15.0)
print(roomOne.squareMeter)

let roomTwo: Area3 = Area3(fromSquareMeter: 33.06)
print(roomTwo.squareMeter)

let roomThree: Area3 = Area3(value: 30.0)
print(roomThree.squareMeter)

let roomFour: Area3 = Area3(55.0)
print(roomFour) // Area3(squareMeter: 55.0)
print(roomFour.squareMeter)

// Area3() // error: missing argument for parameter 'fromPy' in call
