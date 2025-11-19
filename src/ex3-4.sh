#!/bin/bash

scores=()

while true; do
  echo "===================="
  echo "1) 과목성적 추가"
  echo "2) 입력된 모든 점수 보기"
  echo "3) 평균 점수 확인"
  echo "4) 평균 등급(GPA) 변환"
  echo "5) 종료"
  echo "===================="
  read -p "선택: " menu

  case $menu in
    1)
      read -p "점수 입력: " s
      scores+=("$s")
      ;;
    2)
      echo "현재 점수: ${scores[@]}"
      ;;
    3)
      sum=0
      for s in "${scores[@]}"; do sum=$((sum + s)); done
      avg=$((sum / ${#scores[@]}))
      echo "평균 점수 = $avg"
      ;;
    4)
      if [ ${#scores[@]} -eq 0 ]; then
        echo "점수가 없습니다."
      else
        sum=0
        for s in "${scores[@]}"; do sum=$((sum + s)); done
        avg=$((sum / ${#scores[@]}))
        echo -n "평균 등급 = "
        [ $avg -ge 90 ] && echo "A" || echo "B"
      fi
      ;;
    5)
      echo "종료합니다."
      exit 0
      ;;
    *)
      echo "잘못된 입력"
  esac
done
