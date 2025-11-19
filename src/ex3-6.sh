#!/bin/bash

if [ $# -lt 2 ]; then
  echo "사용법: $0 인자1 인자2 ..."
  exit 1
fi

echo "Python 실행:"
python3 run.py "$@"
