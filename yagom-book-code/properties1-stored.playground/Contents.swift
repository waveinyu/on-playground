import UIKit

var greeting = "Hello, playground"

// 구조체의 저장 프로퍼티
// 좌표
struct CoordinatePoint {
    var x: Int
    var y: Int
}

// 구조체에는 기본적으로 저장 프로퍼티를 매개변수로 갖는 이니셜라이즈가 있다.
// init() 메서드를 사용하지 않아도 된다는 뜻(굳이 내가 구현하지 않아도 된다는 뜻)
let wavePoint: CoordinatePoint = CoordinatePoint(x: 10, y: 5)

// 클래스의 저장 프로퍼티
// 사람이 있는 위치 정보
class Position {
    var point: CoordinatePoint // 저장 프로퍼티(var 변수)
    let name: String // 저장 프로퍼티(let 상수)
    
    // !! 프로퍼티의 기본값을 지정해주지 않는다면 이니셜라이저를 따로 정의해주어야 한다. !!
    // 파라미터의 이름은 반드시 일치하지 않아도 됨!
    init(name: String, currentPoint: CoordinatePoint) { // 이 문장이 [사용자 정의 이니셜라이저]
        self.name = name
        self.point = currentPoint
    }
}


// 사용자 정의 이니셜라이저를 호출해야만 한다.
// 그렇지 않으면 프로퍼티 초깃값을 할당할 수 없기 때문에 인스턴스 생성이 불가능하다.
let wavePosition: Position = Position(name: "wave", currentPoint: wavePoint) // 사용자 정의 이니셜라이저 호출문

/* 사용자 정의 이니셜라이저
 사용자 정의 이니셜라이저를 통해 개발자는 인스턴스 생성 시 필요한 데이터를 제공하고,
 초기화 과정에서 추가적인 설정이나 검증을 수행할 수 있습니다.
 이는 타입의 인스턴스가 일관되고 예상된 상태로 생성되도록 보장하는 데 중요한 역할을 합니다.
 by GPT 4.0
 */


// :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

struct CoordinatePoint2 {
    var x: Int = 0 // 저장 프로퍼티
    var y: Int = 0 // 저장 프로퍼티
}

// 프로퍼티의 초깃값을 할당했다면 굳이 초깃값을 넘길 필요가 없다.
let wavePoint2: CoordinatePoint2 = CoordinatePoint2()

// 물론, 기존에 초깃값을 할당할 수 있는 이니셜라이저도 가능하다.
let whalePoint: CoordinatePoint2 = CoordinatePoint2(x: 10, y: 5)

print("wave's Point: \(wavePoint2.x), \(wavePoint2.y)")
print("whale's Point: \(whalePoint.x), \(whalePoint.y)")

// 사람의 위치 정보
class Position2 {
    var point: CoordinatePoint2 = CoordinatePoint2() // 저장 프로퍼티
    var name: String = "Unknown"
}

// 초깃값을 지정해줬다면 사용자 정의 이니셜라이저를 사용하지 않아도 된다.
let wavePosition2: Position2 = Position2() // (0, 0)으로 초깃값을 지정해두었기 때문에 해당 좌표로 출력

wavePosition2.point = wavePoint2
wavePosition2.name = "유영"
print(wavePosition2.point, wavePosition2.name)

// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

// 옵셔널 저장 프로퍼티
struct CoordinatePoint3 {
    // 위치는 x, y값이 모두 있어야 하므로 옵셔널이면 안 된다.
    var x: Int
    var y: Int
}

// 사람의 위치 정보
class Position3 {
    // 현재 사람의 위치를 모를 수도 있다: 옵셔널
    var point: CoordinatePoint3?
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

// 이름은 필수지만 위치는 모를 수 있다.
let wavePosition3: Position3 = Position3(name: "유용")
print(wavePosition3.name, wavePosition3.point) // 유용 nil

// 위치를 알게되면 그때 할당해준다.
wavePosition3.point = CoordinatePoint3(x: 10, y: 20)
print(wavePosition3.name, wavePosition3.point) // 유용 Optional(__lldb_expr_27.CoordinatePoint3(x: 10, y: 20))

