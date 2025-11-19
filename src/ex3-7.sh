#!/bin/bash

while true; do
  echo "===================="
  echo "1) 사용자 정보 (who)"
  echo "2) CPU 사용률 (top -l 1 | grep CPU)"
  echo "3) 메모리 사용량 (vm_stat)"
  echo "4) 디스크 사용량 (df -h)"
  echo "5) 종료"
  echo "===================="
  read -p "선택: " m

  case $m in
    1) who ;;
    2) top -l 1 | grep "CPU" ;;
    3) vm_stat ;;
    4) df -h ;;
    5) exit 0 ;;
    *) echo "잘못된 선택" ;;
  esac
done
