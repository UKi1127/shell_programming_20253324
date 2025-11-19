#!/bin/bash

if [ $# -ne 2 ]; then
  echo "사용법: $0 숫자1 숫자2"
  exit 1
fi

a=$1
b=$2

echo "두 숫자: $a, $b"
echo "덧셈: $((a + b))"
echo "뺄셈: $((a - b))"
echo "곱셈: $((a * b))"

if [ $b -ne 0 ]; then
  echo "나눗셈: $((a / b))"
else
  echo "나눗셈 불가 (0으로 나눔)"
fi
