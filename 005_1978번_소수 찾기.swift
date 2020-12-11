/*
문제
주어진 수 N개 중에서 소수가 몇 개인지 찾아서 출력하는 프로그램을 작성하시오.

입력
첫 줄에 수의 개수 N이 주어진다. N은 100이하이다. 다음으로 N개의 수가 주어지는데 수는 1,000 이하의 자연수이다.

출력
주어진 수들 중 소수의 개수를 출력한다.
*/

/*

아레니우스의 체....
첫번째꺼는 냅두고 나머지 배수들은 모두 제거

*/

let N = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map{Int($0)!}
print(numbers)

var visited = Array(repeating: false, count: 1001)
var prime = [Int]()

for number in 2...1000 {
  if visited[number] == false {
    prime.append(number)
    visited[number] = true
  }

  temp = number + number
  while temp < 1001 {
    visited[temp] = true
    temp = temp + number
  }
}

print((prime + numbers).count - (Array(Set(prime + numbers)).count))