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
