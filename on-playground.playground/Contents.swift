import UIKit

// 1. 임의의 문자열을 넣으면 랜덤으로 철자를 추출하는 함수: 나
func randomExcecute(str a: String) -> (Character) {
    let char = a.randomElement()!
    
    return char
}

// 1-1. 예제
func chooseRandomString(_ chars: String) -> String { // 문자열로 형변환 해줌
    let randomString = String(chars.randomElement()!)
    return randomString
}



// 2. 소수 판별 함수: 나
// 1과 자기 자신만으로 나누어 떨어지는 1보다 큰 양의 정수 판별 함수 만들기
func isPrimeNum(_ number: Int) -> String {
    for i in 2...number-1 {            // 2부터 n-1까지의 숫자에서 약수가 존재하면 소수가 아님
        if number % i == 0 {
            return "소수가 아닙니다."
        }
    }
    return "소수입니다."
}

print(isPrimeNum(10))

// guard문으로 해보기
func isPrimeCheck(_ number: Int) -> String {
    for i in 2...number-1 {
        guard number % i != 0 else { // guard문은 !condition 인 거 기억하기
            return "소수가 아닙니다." // 한 번이라도 나누어 떨어지는 숫자가 있다면 소수가 아님
        }
    }
    return "소수입니다." // 나누어 떨어지는 게 하나도 없을 때 소수로 판별
}

print(isPrimeCheck(11))




// 2-1. 예제
func primeNumberCheck(num: Int) -> Bool {
    for i in 2..<num {
        if num % i == 0 {
            return false
        }
    }
    return true
}

if primeNumberCheck(num: 3) {
    print("소수입니다")
} else {
    print("소수가 아닙니다")
}


// 3. 팩토리얼 함수 구하기
func factorial(_ num: Int) -> Int {
    var result: Int = 1
    
    for i in 1...num { // 1 * 1 + 1 * 2 + ... 1 * num
        result = result * i
    }
    return result
}


print(factorial(5))


// 3-1. 재귀함수: 자기 자신을 반복해서 호출하는 함수
// 조건을 걸어두지 않으면 스택오버플로우 현상이 나타날 수 있으므로 주의해야 한다
func factorialFx(num: Int) -> Int {
    /**
     ! 조건을 갖지 않으면 아래와 같은 경고가 발생 !
     Function call causes an infinite recursion
     함수 호출로 인해 무한 재귀 호출이 발생합니다.
     */
    if num <= 1 {
        return 1
    }
    return num * factorialFx(num: num - 1)
}

print(factorialFx(num: 5))
