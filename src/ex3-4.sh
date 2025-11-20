#!/bin/bash

# 점수 배열 초기화
scores=()

# 무한 반복 루프
while true; do
  # 메뉴 출력
  echo "===================="
  echo "1) 과목성적 추가"
  echo "2) 입력된 모든 점수 보기"
  echo "3) 평균 점수 확인"
  echo "4) 평균 등급(GPA) 변환"
  echo "5) 종료"
  echo "===================="
  
  # 사용자로부터 메뉴 선택 받기
  read -p "선택: " menu

  case $menu in
    # 1) 과목 성적 추가
    1)
      # 여러 점수를 공백으로 구분하여 입력받기
      read -p "점수 입력 (공백으로 구분): " -a input_scores
      
      # 입력된 점수가 숫자인지 확인 후 배열에 추가
      for s in "${input_scores[@]}"; do
        if [[ "$s" =~ ^[0-9]+$ ]]; then
          scores+=("$s")  # 유효한 숫자만 배열에 추가
        else
          echo "$s는 숫자가 아닙니다. 다시 입력하세요."  # 숫자가 아닌 경우 경고
        fi
      done
      ;;
    
    # 2) 입력된 모든 점수 보기
    2)
      echo "현재 점수: ${scores[@]}"  # 입력된 모든 점수 출력
      ;;
    
    # 3) 평균 점수 확인
    3)
      sum=0
      count=0
      for s in "${scores[@]}"; do
        sum=$((sum + s))  # 점수 합산
        count=$((count + 1))  # 점수 개수 세기
      done
      avg=$((sum / count))  # 평균 점수 계산
      echo "평균 점수 = $avg"  # 평균 점수 출력
      ;;
    
    # 4) 평균 등급(GPA) 변환
    4)
      if [ ${#scores[@]} -eq 0 ]; then
        echo "점수가 없습니다."  # 점수가 없을 경우 메시지 출력
      else
        sum=0
        for s in "${scores[@]}"; do
          sum=$((sum + s))  # 점수 합산
        done
        avg=$((sum / ${#scores[@]}))  # 평균 점수 계산
        echo -n "평균 등급 (GPA) = "

        # 성적 기준에 따른 GPA 변환
        if [ $avg -ge 90 ]; then
          echo "A+ (4.5) - 성적 기준: 90 이상"
        elif [ $avg -ge 85 ]; then
          echo "A (4.0) - 성적 기준: 85 ~ 89"
        elif [ $avg -ge 80 ]; then
          echo "B+ (3.5) - 성적 기준: 80 ~ 84"
        elif [ $avg -ge 75 ]; then
          echo "B (3.0) - 성적 기준: 75 ~ 79"
        elif [ $avg -ge 70 ]; then
          echo "C+ (2.5) - 성적 기준: 70 ~ 74"
        elif [ $avg -ge 65 ]; then
          echo "C (2.0) - 성적 기준: 65 ~ 69"
        elif [ $avg -ge 60 ]; then
          echo "D+ (1.5) - 성적 기준: 60 ~ 64"
        elif [ $avg -ge 50 ]; then
          echo "D (1.0) - 성적 기준: 50 ~ 59"
        else
          echo "F (0.0) - 성적 기준: 50 미만"
        fi
      fi
      ;;
    
    # 5) 종료
    5)
      echo "종료합니다."  # 종료 메시지
      exit 0  # 스크립트 종료
      ;;
    
    # 잘못된 입력 처리
    *)
      echo "잘못된 입력"  # 잘못된 메뉴 선택 시 메시지 출력
  esac
done
