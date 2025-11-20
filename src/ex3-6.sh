#!/bin/bash

# 사용자로부터 두 개 이상의 값을 입력받기
echo "두 개 이상의 값을 입력하세요 (공백으로 구분)"
read -a inputs  # 사용자로부터 입력받은 값을 배열로 저장

# 입력된 값이 두 개 이상인지 확인
if [ ${#inputs[@]} -lt 2 ]; then
  echo "사용법: 두 개 이상의 값을 입력해야 합니다."
  exit 1
fi

# 입력된 값을 python 스크립트로 전달
echo "입력된 값: ${inputs[@]}"
echo "Python 실행:"
python3 run.py "${inputs[@]}"  # 입력값을 run.py에 전달