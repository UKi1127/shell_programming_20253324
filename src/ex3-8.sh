#!/bin/bash

# 1) DB 폴더 확인 및 생성
if [ ! -d DB ]; then
  mkdir DB
fi

# 2) DB 안에 파일 5개 생성
cd DB
touch f1.txt f2.txt f3.txt f4.txt f5.txt

# 3) 압축
tar -czf db.tar.gz f*.txt

cd ..

# 4) train 폴더 생성
mkdir -p train

# 5) 링크 생성 (심볼릭 링크)
ln -sf ../DB/f1.txt train/f1.txt
ln -sf ../DB/f2.txt train/f2.txt
ln -sf ../DB/f3.txt train/f3.txt
ln -sf ../DB/f4.txt train/f4.txt
ln -sf ../DB/f5.txt train/f5.txt

echo "DB 및 train 구성 완료."
