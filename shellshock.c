#include<stdio.h>

int main(){
  setresuid(getegid(),getegid(),getegid());
  setresgid(getegid(),getegid(),getegid());
  return 0;
}
