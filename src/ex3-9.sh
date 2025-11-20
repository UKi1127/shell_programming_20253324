#!/bin/bash

DB="DB.txt"
touch "$DB"

# 팀원 목록 저장할 배열
declare -a team_members

while true; do
  echo "===================="
  echo "1) 팀원정보 추가"
  echo "2) 팀원과 한 일 기록"
  echo "3) 팀원 검색"
  echo "4) 수행 내용 검색"
  echo "5) 종료"
  echo "===================="

  read -p "선택: " sel

  case $sel in

    # 1) 팀원 정보 추가
    1)
      read -p "이름: " name
      read -p "생일/전화번호: " info
      # 공백을 없애고 이름을 저장
      name=$(echo "$name" | tr -d '[:space:]')
      echo "[INFO] $name : $info" >> "$DB"
      team_members+=("$name")  # 배열에 팀원 이름 추가
      echo "팀원 정보가 추가되었습니다."
      ;;

    # 2) 팀원과 한 일 기록
    2)
      # 팀원 선택
      echo "팀원 목록:"
      for i in "${!team_members[@]}"; do
        echo "$((i + 1)). ${team_members[$i]}"  # 팀원 목록 출력
      done
      read -p "팀원 선택 (번호): " member_num

      # 선택한 팀원 이름 가져오기
      selected_member="${team_members[$((member_num - 1))]}"

      # 날짜와 작업 내용 입력
      read -p "날짜(YYYY-MM-DD): " date
      read -p "한 일: " work

      # 팀원과 한 일 기록을 DB에 저장
      echo "[WORK] $selected_member - $date : $work" >> "$DB"
      echo "수행 내용이 기록되었습니다."
      ;;

    # 3) 팀원 검색
    3)
      read -p "검색할 이름: " name
      # 1. 입력된 이름의 공백을 모두 제거
      name=$(echo "$name" | tr -d '[:space:]')
      
      echo "검색 결과:"
      
      # 2. DB.txt에서 [INFO] 태그와 이름, 그리고 구분자( : )까지 정확히 일치하는 라인을 검색
      grep "^\[INFO\] $name :" "$DB"
      
      # grep "$name" "$DB"
      ;;

    # 4) 수행 내용 검색
    4)
      read -p "검색할 날짜(YYYY-MM-DD): " date
      echo "검색 결과:"
      grep "[WORK].* - $date" "$DB"
      ;;

    # 5) 종료
    5)
      echo "종료합니다."
      exit 0  # 스크립트 종료
      ;;
    # 잘못된 입력 처리
    *)
      echo "잘못된 입력입니다. 다시 선택하세요."
      ;;

  esac
done
