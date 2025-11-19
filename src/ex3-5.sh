#!/bin/bash

my_ls() {
  cmd="ls $1"
  eval $cmd
}

echo "옵션을 입력하세요 (예: -l 또는 -a)"
read opt

my_ls "$opt"
