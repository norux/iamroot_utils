## Iamroot ARM Kernel 분석 12차 D조

[iamroot 홈페이지](http://www.iamroot.org)

## 설치 방법

같이 배포된 install.sh 스크립트로 설치를 하면 다음 두 파일이 설치 됩니다.

```bash
$ ./install.sh
```

1. vimrc (vim 리소스파일)
1. iamroot_comment.vim (주석 플러그인)


> 설치를 하게 되면 기존의 vimrc 파일은 backup 폴더 하위에 백업됩니다.

> 필요하다면, 수동으로 복원할 수 있습니다.

> 복원 시에는 백업파일을 ~/.vimrc 로 대체 하시면 됩니다.

> ```bash
  $ cp backup/vimrc.back.TIME ~/.vimrc
  ```

### vimrc

* 이 파일은 vim의 설정파일(리소스파일) 입니다.

* 플러그인의 매핑을 기본적으로 포함합니다.

* ctags, cscope의 경로를 재 설정해 줄 필요가 있습니다.


### iamroot_comment.vim 

* 이 vim 플러그인은 주석을 보다 쉽게 달기 위해 제작된 플러그인입니다.


#### 사용 방법

* 배포되는 install.sh 프로그램은 기본적으로 ~/.vimrc에 F5, F6, F7 로 매핑하게됩니다.

* 만약 이미 위의 3가지 키를 사용하고 있다면 변경 후 사용하세요.

* [F5] Analyzing Comment: 코드 분석을 위해 사용되는 주석입니다.

* [F6] Daily Summary: 매일의 요약입니다. 스터디 날짜, 장소, 참석자 정보 등을 담고 있습니다. 

* [F7] File Summary: 파일의 전체적인 요약, 설명을 위한 주석입니다.
