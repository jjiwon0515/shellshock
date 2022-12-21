1. ehco 함수를 이용하여 화면에 "Hello bash"를 출력할 수 있도록 스크립트 작성
2. 변수 선언
3. 리스트  변수 선언(배열) 


#!/bin/bash

echo "Hello bash"


im='root'
my_path='/etc/hi'
echo $im
echo $my_path


lemons=("httpd" "https" "woww")
echo ${lemons[1]}     #lemons 배열의 두 번째 요소 출력
echo ${lemons[@]}     #lemons 배열의 모든 데이터 출력
echo ${lemons[*]}     #lemons 배열의 모든 데이터 출력
echo ${#lemons[@]}    #lemons 배열 크기 출력


#4. 조건문
ping -c 1 192.168.0.1 1> /dev/null
if [ $? == 0 ]
then 
  echo "게이트웨이 핑 성공!"
 else
  echo "게이트웨이 핑 실패!"
 fi
 
