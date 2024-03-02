import UIKit

var greeting = "Hello, playground"

/* 클래스의 타입 메서드 */

class AClass {
    static func staticTypeMethod(){
        print("AClass staticTypeMethod")
    }
    
    class func classTypeMethod() {
        print("AClass classTypeMethod")
    }
}


class BClass: AClass {
    // error: cannot override static method
//    override static func staticTypeMethod() { } // 컴파일 시 에러
    
    override class func classTypeMethod() {
        print("BClass classtypeMethod")
    }
}

AClass.staticTypeMethod()
AClass.classTypeMethod()
BClass.classTypeMethod()


/* 타입 프로퍼티와 타입 메서드의 사용 */
// 시스템 음량은 한 기기에서 유일한 값이어야 한다
struct SystemVolume {
    // 타입 프로퍼티를 사용하면 언제나 유일한 값이 된다.
    static var volume: Int = 5
    
    // 타입 프로퍼티를 제어하기 위해 타입 메서드를 사용한다.
    static func mute() {
        self.volume = 0
        // System.Volume = 0
        // Self.volume = 0
        // 모두 같은 표현
    }
}

// 네비게이션 역할은 여러 인스턴스가 수행할 수 있다.
class Navigator {
    // 네비게이션 인스턴스마다 음량을 따로 설정할 수 있다.
    var volume: Int = 5
    
    func guideWay() {
        // 네비게이션 외 다른 시스템 볼륨 재생원 음소거
        SystemVolume.mute()
    }
    
    func finishGuideWay() {
        // 기존 재생된 음량 복구
        SystemVolume.volume = self.volume // 5로 복구
    }
}

SystemVolume.volume = 10

let myNavi: Navigator = Navigator()
myNavi.guideWay()
myNavi.finishGuideWay()

