//: Playground - noun: a place where people can play

import UIKit

struct Task {
    var title: String?
    var time: Int?
}

var callTask = Task(title: "Call to Randy", time: 10 * 60)
var reportTask = Task(title: "Report to Boss", time: nil)

var todayTask: [Task] = []
todayTask += [callTask, reportTask]
todayTask[1].time = 15 * 60

callTask.title = "Call to Tobby"

print("today task = \(todayTask), callTask = \(callTask)")

/*
구조체는 Class와 함께 데이터 모델의 중요한 구성요소 중 하나.

내부에 변수나 상수 또는 함수를 선언한 뒤 인스턴스(Instance)를 만들어서 사용한다.
주로 좌표나 크기처럼 간단한 값을 표현하는 데 많이 사용되어 왔다
Swift에서 Class의 대안으로 그 역할이 커지고 있다

구조체는 Value Type
Value 타입의 인스턴스
Int나 Double 과 같이 직접 값을 가지는 것
Reference 타입의 인스턴스
인스턴스가 있는 메모리 번지를 참조하는 것
Value 타입은 할당시에 인스턴스가 복사되지만
Reference 타입은 할당시에 참조하는 메모리번지만 전달된다

- 출처 : http://tryhelloworld.co.kr/
*/
