# shellshock

shellshock 취약점은 함수와 환경변수를 생성하는데 발생하는 버그를 이용한 취약점이다.<br>
GNU bash shell에서 환경변수를 통해 공격자가 원격으로 명령어를 실행할 수 있는 취약점<br>
<br>
<br>
커널<br>
운영체제의 핵심부로 컴퓨터 자원들을 관리하는 역할<br>
커널은 항상 컴퓨터 자원만 바라보기 때문에 사용자와의 상호작용은 전혀 지원하지 않는다<br>
그래서 대표적인 시스템 프로그램인 쉘이 사용자의 상호작용 기능 역할을 한다<br>
사용자는 쉘을 통해 커널에 명령어를 보낼 수 있는 것이다.<br>

리눅스 쉘 종류와 위치 : bash(bin/bash) , tsh , tcsh , zsh : 모두 bin 폴더안에 위치한다.<br>
쉘은<br>
1) 커널과 사용자 사이를 이어준다. (하드웨어 -> OS(Kernel) -> Shell -> User)<br>
2) 하나의 명령어 처리기 <br>
3) 사용자로부터 명령어를 받아 쉘이 처리한다. <br>
<br>
CGI란? Common Cateway Interface<br>
서버와 애플리케이션 간에 데이터를 주고 받는 방식/방법/규약(프로토콜)<br>
웹 서버의 종류가 여러가지이고 서로 입출력을 주고받을 표준이 필요하기 때문에 필요하다<br>
<br>
<br>
CLIENT <-> WEB SERVER <-> CGI PROGRAM<br>
<br>
<br>
shellshock 취약점 <br>
bash shell에서 환경변수를 통한 공격자가 원격으로 명령어를 실행할 수 있는 취약점이다.<br>
<br>
<br>
env x='(){ :;}; echo vulnerable' bash -c "echo test"<br>
env명령어 : 지정된 환경변수를 보여주거나 새로 만든다.


<img width="470" alt="shellshock" src="https://user-images.githubusercontent.com/107084512/208839683-66998a5d-a261-43f9-a004-297243cff03c.png">
이런 원리로 shellshock 취약점이 된다고 한다. 
그래서 관련된 쉘 스크립트를 직접 만들어보면서 이해하기로 했다.


또한 ls -al에서의 권한과 user, group에 대해서도 새롭게 알게 되었다.
![ls_al](https://user-images.githubusercontent.com/107084512/208868052-c5dfa98e-93a7-4640-841d-54b7931d621a.png)

사진에서 맨 앞부분을 -/rwx/rwx/rwx 이런식으로 나눌 수 있다. -(파일) or d(폴더)로 파일인지 폴더인지 알려준다.
그 뒤에 오는 권한은 순서대로 소유자/그룹/사용자 이런식으로 볼 수 있다.
마지막으로 권한 뒤에 오는 이름들은 순서대로 owner와 group을 가르킨다.
예)root root (UID GID) 이런식으로 가르킨다


이 문제에서 또 다른 핵심은 flag의 그룹 권한이 shellshock 실행파일의 그룹 권한과 같았기 때문에 이 점을 이용해야한다는 것도 인식했어야하는 것이다.

1점짜리 문제라서 쉬울거라고 생각했는데 너무너무 어려웠던 문제였다..
<img width="589" alt="중요한 과정(shellshock)" src="https://user-images.githubusercontent.com/107084512/208874385-e885c284-009d-498c-bdc5-2edf2556ae9e.png">

풀어보고도 찝찝해서 소스코드에 있는 함수들을 다시 찾아봤다<br>
setuid 함수에 대해서 찾아보는 도중에 위의 사진을 발견하게 되었다.<br>
setuid() : 실행 파일에 적용하면 실 사용자(프로그램을 실제 실행 중인 사용자)에서 프로그램 소유자의 ID로 유호 사용자가 변경됨<br>
그래서 이번 문제에서 shellshock 파일을 실행할 때 shellshock_pwn으로 권한 상승을 할 수 있었던 것이다.<br>
궁금증이 풀렸당

https://whatdocumentary.tistory.com/50
