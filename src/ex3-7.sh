#!/bin/bash

while true; do
  echo "===================="
  echo "1) 사용자 정보 (who)"
  echo "2) CPU 사용률 (top -l 1 | grep CPU)"
  echo "3) 메모리 사용량 (free -h)"
  echo "4) 디스크 사용량 (df -h)"
  echo "5) 종료"
  echo "===================="
  read -p "선택: " m

  case $m in
    1) 
      who  # 사용자 정보 출력
      ;;
    2) 
      echo "CPU 사용률:"
      top -l 1 | grep "CPU"  # CPU 사용률 출력
      ;;
    3)
      vm_stat  # MacOS에서 메모리 사용량 출력
      ;;
    4)
      df -h  # 디스크 사용량 출력
      ;;
    5) 
      echo "종료합니다."
      exit 0  # 스크립트 종료
      ;;
    *) 
      echo "잘못된 선택"  # 잘못된 입력 처리
      ;;
  esac
done
