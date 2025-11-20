#!/bin/bash

# 1) DB 폴더 확인 및 생성
# DB 폴더가 없으면 새로 생성
if [ ! -d DB ]; then
  mkdir DB  # DB 폴더 생성
fi

# 2) DB 안에 파일 5개 생성
# DB 폴더로 이동 후 5개의 빈 파일을 생성
cd DB
touch f1.txt f2.txt f3.txt f4.txt f5.txt 

# 3) 압축
# DB 폴더 내의 모든 .txt 파일을 tar 명령어로 압축하여 db.tar.gz 파일 생성
tar -czf db.tar.gz f*.txt  # *.txt 파일들을 db.tar.gz로 압축

cd ..

# 4) train 폴더 생성
mkdir -p train

# 5) 링크 생성 (심볼릭 링크)
# DB 폴더의 5개 파일을 train 폴더 내에 심볼릭 링크로 연결
ln -sf ../DB/f1.txt train/f1.txt 
ln -sf ../DB/f2.txt train/f2.txt 
ln -sf ../DB/f3.txt train/f3.txt 
ln -sf ../DB/f4.txt train/f4.txt 
ln -sf ../DB/f5.txt train/f5.txt  

# 6) 완료 메시지 출력
echo "DB 및 train 구성 완료."  # 모든 작업이 끝났으면 완료 메시지 출력
