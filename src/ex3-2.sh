#!/bin/bash

echo "값을 2개 이상 입력하세요 (띄어쓰기로 구분)"
read -a arr

echo "입력된 값: ${arr[@]}"

for x in "${arr[@]}"; do
  y=$(echo "0.5 * $x * $x" | bc -l)
  echo "x=$x → y=0.5*x^2 = $y"
done
