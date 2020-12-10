/*
문제
그래프를 DFS로 탐색한 결과와 BFS로 탐색한 결과를 출력하는 프로그램을 작성하시오. 단, 방문할 수 있는 정점이 여러 개인 경우에는 정점 번호가 작은 것을 먼저 방문하고, 더 이상 방문할 수 있는 점이 없는 경우 종료한다. 정점 번호는 1번부터 N번까지이다.

입력
첫째 줄에 정점의 개수 N(1 ≤ N ≤ 1,000), 간선의 개수 M(1 ≤ M ≤ 10,000), 탐색을 시작할 정점의 번호 V가 주어진다. 다음 M개의 줄에는 간선이 연결하는 두 정점의 번호가 주어진다. 어떤 두 정점 사이에 여러 개의 간선이 있을 수 있다. 입력으로 주어지는 간선은 양방향이다.

출력
첫째 줄에 DFS를 수행한 결과를, 그 다음 줄에는 BFS를 수행한 결과를 출력한다. V부터 방문된 점을 순서대로 출력하면 된다.
*/

/*
DFS : Depth First Search
BFS : Breath First Search

정점, 1 <= N <= 1000
간선, 1 <= M <= 10000
시작할 정점 번호 V
다음 M개의 줄에는 간선을 연결하는 두 정점의 번호 (간선은 양방향)
*/

let firstLine = readLine()!.split(separator: " ").map{Int($0)!}
let N = firstLine[0]
let M = firstLine[1]
let start = firstLine[2]

// dictionary
var matrix = [Int:[Int]]()

for _ in 1...M {
  let edge = readLine()!.split(separator: " ").map{Int($0)!}
  if matrix[edge[0]] == nil {
    matrix[edge[0]] = [edge[1]]
  } else {
    matrix[edge[0]]?.append(edge[1])
  }
  if matrix[edge[1]] == nil {
    matrix[edge[1]] = [edge[0]]
  } else {
    matrix[edge[1]]?.append(edge[0])
  }
}

// matrix remove duplicate & sort
for (key, value) in matrix {
  matrix[key] = Array(Set(value)).sorted()
}

// print(matrix)

// DFS : Stack, Stack에 넣으면 방문처리
var visited = Array(repeating: false, count: 1001)
var stack = [Int]()

var current = start
stack.append(current)
visited[current] = true
print(current, terminator: " ")

while true {
  if stack.count == 0 {
    break
  }
  current = stack.last!
  // print(current)
  let nexts = matrix[current]
  if nexts != nil {
    var visitAll = true
    for next in nexts! {
      if visited[next] == false {
        visitAll = false
      }
    }
    if visitAll == true {
      stack.removeLast()
      continue
    }
    for next in nexts! {
      if visited[next] == false {
        stack.append(next)
        visited[next] = true
        print(next, terminator: " ") 
        break
      }
    }
  } else {
    break
  }
}
print()

// BFS : deque, queue에 넣으면 방문처리
visited = Array(repeating: false, count: 1001)
var queue = [Int]()

current = start
queue.append(current)
visited[current] = true
print(current, terminator: " ")

while true {
  if queue.count == 0 {
    break
  }
  current = queue[0]
  queue.removeFirst()
  let nexts = matrix[current]
  if nexts != nil {
    for next in nexts! {
      if visited[next] == false {
        queue.append(next)
        visited[next] = true
        print(next, terminator: " ")
      }
    }
  } else {
    break
  }
}