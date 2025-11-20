#!/bin/bash

# 점수를 입력받기 (예: 90 77 100 83)
echo "점수를 입력하세요 (예: 90 77 100 83)"
read -a scores  # 공백으로 구분된 여러 점수를 배열로 입력 받기

# 총합, 카운트, 등급 카운트를 위한 변수들 초기화
total=0
count=0
A_count=0
B_count=0

# 개별 점수와 등급 출력
echo "=== 개별 등급 ==="
for s in "${scores[@]}"; do
  # 90 이상은 A, 그 외는 B로 분류
  if [ $s -ge 90 ]; then
    echo "$s → A"  # A 등급 출력
    A_count=$((A_count + 1))  # A 등급 카운트
  else
    echo "$s → B"  # B 등급 출력
    B_count=$((B_count + 1))  # B 등급 카운트
  fi

  total=$((total + s))  # 총합 계산
  count=$((count + 1))  # 점수 개수 카운트
done

# 평균 점수 계산
avg=$((total / count))

# 평균 점수 출력
echo ""
echo "평균 점수: $avg"

# 평균 등급 출력
echo -n "평균 등급: "
# 평균 점수가 90 이상이면 A, 그렇지 않으면 B
[ $avg -ge 90 ] && echo "A" || echo "B"
