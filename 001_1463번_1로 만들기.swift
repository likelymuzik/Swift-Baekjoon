/*
문제
정수 X에 사용할 수 있는 연산은 다음과 같이 세 가지 이다.

X가 3으로 나누어 떨어지면, 3으로 나눈다.
X가 2로 나누어 떨어지면, 2로 나눈다.
1을 뺀다.
정수 N이 주어졌을 때, 위와 같은 연산 세 개를 적절히 사용해서 1을 만들려고 한다. 연산을 사용하는 횟수의 최솟값을 출력하시오.

입력
첫째 줄에 1보다 크거나 같고, 106보다 작거나 같은 정수 N이 주어진다.

출력
첫째 줄에 연산을 하는 횟수의 최솟값을 출력한다.
*/

/*
1 <= N <= 106
숫자 N을 1로 만드는데 필요한 연산의 최소 횟수 f(N)

f(N) = min(f(N/3)+1, f(N/2)+1, f(N-1)+1)

*/

let N = Int(readLine()!)!

var f = Array(repeating: 0, count: N+1)

for i in 1...N {
  if i == 1 {
    continue
  }
  var candidate = [Int]()
  if i % 3 == 0 {
    candidate.append(f[i/3]+1)
  }
  if i % 2 == 0 {
    candidate.append(f[i/2]+1)
  }
  if i - 1 >= 1 {
    candidate.append(f[i-1]+1)
  }
  f[i] = candidate.min()!
}

print(f[N])