#!/bin/zsh

# 환경변수 등록
echo "====== 1) 환경변수 등록 ======"
# .zshrc에 MYENV라는 환경변수를 등록 (macOS에서는 zshrc 사용)
echo 'export MYENV="Hello Shell"' >> ~/.zshrc  # .zshrc에 환경변수 추가
source ~/.zshrc  # .zshrc 파일을 다시 로드하여 환경변수 반영
echo "등록된 환경변수 값: $MYENV"  # 등록된 값 출력

echo ""
echo "====== 2) 터미널/셸에서 유지되는지 확인 ======"
# 현재 셸에서 MYENV 값 확인
echo "현재 MYENV 값: $MYENV"

echo ""
echo "====== 3) 환경변수 해제 ======"
# .zshrc에서 MYENV 변수 삭제
sed -i '' '/MYENV=/d' ~/.zshrc  # .zshrc 파일에서 MYENV 삭제
# 현재 셸 세션에서 MYENV 변수 제거
unset MYENV  # 셸에서 MYENV 환경변수 제거

echo "해제 후 MYENV 값: $MYENV"  # 해제 후 MYENV 값 확인
echo ""  # 줄바꿈