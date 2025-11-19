#!/bin/bash

echo "1) 환경변수 MYENV 등록"
echo 'export MYENV="Hello Shell"' >> ~/.zshrc
source ~/.zshrc
echo "등록된 값: $MYENV"

echo ""
echo "2) 셸 파일이나 터미널에서 값 유지 확인"
echo "MYENV = $MYENV"

echo ""
echo "3) 환경변수 해제"
# zshrc에서 MYENV 삭제
sed -i '' '/MYENV=/d' ~/.zshrc
source ~/.zshrc
echo "해제 후 값: $MYENV"

echo ""
echo "※ 주의: 해제 후에는 새 터미널에서 echo \$MYENV 하면 빈 값이 출력됨."
