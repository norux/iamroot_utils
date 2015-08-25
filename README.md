## Iamroot ARM Kernel 분석 12차 D조

[iamroot](http://www.iamroot.org)


### iamroot_kernel.vim 

* 이 vim 플러그인은 주석을 보다 쉽게 달기 위해 제작된 플러그인입니다.


#### 사용방법

* 본 코드에 같이 배포되는 install.sh 를 실행시키면 됩니다.

  ```bash
  $ ./install.sh

  ```

  * 배포되는 install.sh 프로그램은 기본적으로 ~/.vimrc에 F5, F6, F7 로 매핑하게됩니다.

  * 만약 이미 위의 3가지 키를 사용하고 있다면 변경 후 사용하세요.

  * [F5] Analyzing Comment: 코드 분석을 위해 사용되는 주석입니다.

  * [F6] Daily Summary: 매일의 요약입니다. 스터디 날짜, 장소, 참석자 정보 등을 담고 있습니다. 

  * [F7] File Summary: 파일의 전체적인 요약, 설명을 위한 주석입니다.
