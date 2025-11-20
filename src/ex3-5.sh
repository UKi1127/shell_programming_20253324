#!/bin/bash

# my_ls 함수 정의 (리눅스 명령어 'ls' 실행)
my_ls() {
  cmd="ls $1"  # 입력받은 옵션을 ls 명령어에 전달
  eval $cmd  # eval을 통해 실제 명령어 실행
}

# 사용자에게 옵션 입력받기
echo "옵션을 입력하세요 (예: -l 또는 -a)"
read opt  # 사용자로부터 옵션 입력 받기

# my_ls 함수 호출, 옵션을 인자로 전달
my_ls "$opt"