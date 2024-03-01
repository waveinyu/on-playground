import UIKit

var greeting = "Hello, playground"

/* 타입 프로퍼티와 인스턴스 프로퍼티*/
class AClass {
    // 저장 타입 프로퍼티
    static var typeProperty: Int = 0
    
    // 저장 인스턴스 프로퍼티
    var instanceProperty: Int = 0 {
        didSet {
            Self.typeProperty = instanceProperty + 100
            // AClass.typeProperty와 Self.typeProperty는 같은 표현이다.
        }
    }
    
    // 연산 타입 프로퍼티
    static var typeComputedProperty: Int {
        get {
            return typeProperty
        }
        
        set {
            typeProperty = newValue
        }
    }
}

AClass.typeProperty = 123

let classInstance: AClass = AClass()
classInstance.instanceProperty = 100

print(AClass.typeProperty)
print(AClass.typeComputedProperty)
// 타입 프로퍼티는 인스턴스를 생성하지 않고도 사용할 수 있으며, 타입에 해당하는 값이다.
// 인스턴스에 접근할 필요 없이 타입 이름만으로도 프로퍼티를 사용할 수 있다.
