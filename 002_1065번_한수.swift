/*
문제
어떤 양의 정수 X의 각 자리가 등차수열을 이룬다면, 그 수를 한수라고 한다. 등차수열은 연속된 두 개의 수의 차이가 일정한 수열을 말한다. N이 주어졌을 때, 1보다 크거나 같고, N보다 작거나 같은 한수의 개수를 출력하는 프로그램을 작성하시오. 

입력
첫째 줄에 1,000보다 작거나 같은 자연수 N이 주어진다.

출력
첫째 줄에 1보다 크거나 같고, N보다 작거나 같은 한수의 개수를 출력한다.
*/

/*
1 <= N <= 1000
1 <= i <= N
각 자리의 수가 등차 수열?
*/

let N = Int(readLine()!)!

var oneNum = [Int]()

for i in 1...N {
  var number = i
  if number < 100 {
    oneNum.append(number)
    continue
  }

  var elements = [Int]()
  while true {
    if number < 10 {
      elements.append(number)
      break
    }
    elements.append(number % 10)
    number = number / 10
  }

  let stand = elements[0] - elements[1]
  var index = 1
  for j in 1...elements.count-2 {
    if stand != (elements[j] - elements[j+1]) {
      break
    }
    index += 1
  }
  if index == elements.count-1 {
    oneNum.append(i)
  }
}
print(oneNum.count)