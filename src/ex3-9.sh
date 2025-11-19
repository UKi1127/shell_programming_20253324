#!/bin/bash

DB="DB.txt"
touch "$DB"

while true; do
  echo "===================="
  echo "1) 팀원정보추가"
  echo "2) 팀원과 한 일 기록"
  echo "3) 팀원검색"
  echo "4) 수행내용검색"
  echo "5) 종료"
  echo "===================="
  read -p "선택: " sel

  case $sel in
    1)
      read -p "이름: " name
      read -p "생일/전화번호: " info
      echo "[INFO] $name : $info" >> $DB
      ;;
    2)
      read -p "날짜(YYYY-MM-DD): " date
      read -p "한 일: " work
      echo "[WORK] $date : $work" >> $DB
      ;;
    3)
      read -p "검색할 이름: " name
      grep "[INFO] $name" $DB
      ;;
    4)
      read -p "검색할 날짜: " date
      grep "[WORK] $date" $DB
      ;;
    5)
      exit 0
      ;;
    *)
      echo "잘못된 입력"
  esac
done
