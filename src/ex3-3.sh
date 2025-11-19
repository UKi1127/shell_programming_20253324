#!/bin/bash

echo "점수를 입력하세요 (예: 90 77 100 83)"
read -a scores

total=0
count=0
A_count=0
B_count=0

echo "=== 개별 등급 ==="
for s in "${scores[@]}"; do
  if [ $s -ge 90 ]; then
    echo "$s → A"
    A_count=$((A_count + 1))
  else
    echo "$s → B"
    B_count=$((B_count + 1))
  fi

  total=$((total + s))
  count=$((count + 1))
done

avg=$((total / count))

echo ""
echo "평균 점수: $avg"
echo -n "평균 등급: "
[ $avg -ge 90 ] && echo "A" || echo "B"
