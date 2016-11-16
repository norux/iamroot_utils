" =======================================================
" File:   iamroot_comment.vim 
" Brief:  코드 분석용 자동 주석 플러그인
" Detail: 1. FileSummary:   파일의 정보 요약
"         2. DailySummary:  당일 참석인원, 참석자 요약
"         3. AnalyzingCode: 코드 분석 주석
"
" Usage:  이 플러그인을 사용하기 위해서, 
"         ~/.vim/plugin 디렉토리에 복사한다.
"
"         그 후, ~/.vimrc에 아래 코드를 추가하여
"         해당 함수를 키 매핑하여 사용한다.
"         ex) map <F5>   <esc>:call IC_FileSummary()
"
" Author: Heebum Kwak (kh-1143@hanmail.net)
" Date:   2015. 08. 25
" Link:   http://norus.tistory.com 
"         http://iamroot.org
" =======================================================

let s:teamName = "IAMROOT-12 fehead"
let s:teamLink = "https://github.com/fehead/linux_a"
let s:authors = {
    \  1: { 'att': 1, 'name': '곽희범', 'email': 'andrew@norux.me' },
    \  2: { 'att': 1, 'name': '임채훈', 'email': 'im.fehead@gmail.com' },
    \  3: { 'att': 1, 'name': '한대현', 'email': 'rhrnak0501@gmail.com' },
    \  4: { 'att': 1, 'name': '민혜미', 'email': 'mhyem2@naver.com' },
    \  5: { 'att': 1, 'name': '김동현', 'email': 'dhkim1027@gmail.com' },
    \  6: { 'att': 1, 'name': '정종채', 'email': 'fynia@naver.com' },
    \  7: { 'att': 1, 'name': '김문영', 'email': 'm03y29@gmail.com' },
    \  8: { 'att': 1, 'name': '정성욱', 'email': 'huber7908@gmail.com' },
    \  9: { 'att': 1, 'name': '김일호', 'email': 'lkimilhol@naver.com' },
    \ 10: { 'att': 1, 'name': '박창수', 'email': 'darkpcs@gmail.com' },
    \ 11: { 'att': 1, 'name': '곽승준', 'email': 'rialtoksj@yahoo.com' },
    \ 12: { 'att': 1, 'name': '배병휴', 'email': 'isswindx@gmail.com' },
    \ 13: { 'att': 1, 'name': '김영준', 'email': 'iam.yeongjunkim@gmail.com' },
    \ 14: { 'att': 1, 'name': '박종성', 'email': '@minidump' },
    \ 15: { 'att': 1, 'name': '박병배', 'email': 'i.billpark@gmail.com' },
    \ 16: { 'att': 1, 'name': '안종찬', 'email': 'ahnchan2@gmail.com' },
    \ 17: { 'att': 1, 'name': '이상선', 'email': 'razr1121@gmail.com' },
    \ 18: { 'att': 1, 'name': '', 'email': '' },
    \ 19: { 'att': 1, 'name': '', 'email': '' },
    \ 20: { 'att': 1, 'name': '', 'email': '' },
    \ 21: { 'att': 1, 'name': '', 'email': '' },
    \ 22: { 'att': 1, 'name': '', 'email': '' },
    \ 23: { 'att': 1, 'name': '', 'email': '' },
    \ 24: { 'att': 1, 'name': '', 'email': '' },
    \ 25: { 'att': 1, 'name': '', 'email': '' },
    \ 26: { 'att': 1, 'name': '', 'email': '' },
    \ 27: { 'att': 1, 'name': '', 'email': '' },
    \ 28: { 'att': 1, 'name': '', 'email': '' },
    \ 29: { 'att': 1, 'name': '', 'email': '' },
    \ 30: { 'att': 1, 'name': '', 'email': '' },
    \ 31: { 'att': 1, 'name': '', 'email': '' },
    \ }

let s:myID = 1
let s:cr = "\<cr>"


" Name:   s:GetProjectFilePath
" Brief:  파일의 경로를 프로젝트의 루트 경로로부터 구한다. (linux/~)
" Return: 파일의 경로
function s:GetProjectFilePath()
    let l:projectRoot = "linux"
    let l:fullPath = expand( "%:p" )
    let l:fullLen  = strlen( l:fullPath )
    let l:rootIdx  = stridx( l:fullPath, l:projectRoot ) 
    let l:projectFilePath = strpart( l:fullPath, l:rootIdx, l:fullLen - l:rootIdx )

    return l:projectFilePath
endfunction


" Name:   s:GetDate
" Brief:  시스템의 날짜를 구한다
" Return: 날짜
function s:GetDate()
    return strftime( "%Y-%m-%d" )
endfunction


" Name:   s:GetTeamInfo
" Brief:  팀 정보를 문자열로 변환하여 반환
" Return: 팀 정보 문자열
function s:GetTeamInfo()
    let l:team = s:teamName . " (" . s:teamLink . ")"
    return l:team
endfunction


" Name:   s:GetAuthorInfo
" Brief:  주석 저자의 정보를 문자열로 변환하여 반환
" Param:  [IN] id: 저자의 ID
" Return: id에 맞는 저자의 정보 문자열
function s:GetAuthorInfo( id )
    let l:author = s:authors[a:id].name . " (" . s:authors[a:id].email . ")"
    return l:author
endfunction


" Name:  s:PrintParticipantsInfo
" Brief: 스터디 참석자의 정보를 출력
function s:PrintParticipantsInfo()
    let l:bOnce = 0
    let l:attend = 0
    for l:i in range( 1, len(s:authors) )
        if s:authors[l:i].name == ''
            break
        endif 

        if s:authors[l:i].att == 0
        	continue
        endif

        if l:bOnce == 0
	        exec "normal I" . " * 참석자: "
	        let l:bOnce = 1
	    else
	        exec "normal I" . " *         "
        endif

        exec "normal A" . s:GetAuthorInfo( l:i ) . s:cr
        let l:attend += 1
    endfor
    exec "normal I" . " *"  . s:cr
    exec "normal I" . " *         참석인원: " . l:attend . " 명" . s:cr
endfunction


" Name:  s:StartComments
" Brief: 주석 시작부
function s:StartComments()
    let l:date   = s:GetDate()
    exec "normal O"
    exec "normal I" . "/* ". s:teamName . " (" . l:date . "):" . s:cr
endfunction

" Name:  s:BarComments
" Brief: 주석 바
function s:BarComments()
    exec "normal I" . " * --------------------------" . s:cr
endfunction

" Name:  s:EndComments
" Brief: 주석 마무리부
function s:EndComments()
    exec "normal I" . " */"
    exec "normal w"
endfunction


" Name:  IC_FileSummary
" Brief: 파일의 요약정보를 주석으로 남긴다.
function IC_FileSummary()
    let l:todo = "todo"
    let l:filePath = s:GetProjectFilePath()
    let l:date    = s:GetDate()
    let l:team    = s:GetTeamInfo()

    exec "normal gg"
    call s:StartComments()
    call s:BarComments()
    exec "normal I" . " * 파일명: " . l:filePath . s:cr
    exec "normal I" . " *" . s:cr
    exec "normal I" . " * 요약:   " . l:todo . s:cr
    exec "normal I" . " * 설명:   " . l:todo . s:cr
    exec "normal I" . " *" . s:cr
    exec "normal I" . " * 팀:   " . l:team . s:cr
    exec "normal I" . " * 날짜: " . l:date . s:cr
    call s:EndComments()
endfunction


" Name:  IC_DailySummary
" Brief: 당일의 요약정보를 주석으로 남긴다.
function IC_DailySummary()
    let l:filePath = s:GetProjectFilePath()
    let l:date   = s:GetDate()
    let l:team   = s:GetTeamInfo()

    call s:StartComments()
    call s:BarComments()
    exec "normal I" . " * 제 00차 스터디" . s:cr
    exec "normal I" . " * 날짜: " . l:date . s:cr
    exec "normal I" . " * 장소: " . s:cr
    exec "normal I" . " *" . s:cr
    exec "normal I" . " * 팀:     " . l:team . s:cr
    call s:PrintParticipantsInfo()
    call s:EndComments()
endfunction


" Name:  IC_AnalyzingCode
" Brief: 분석한 코드의 주석을 상세히 남기기 위한 포맷
function IC_AnalyzingCode()
    call s:StartComments()
    call s:BarComments()
    exec "normal I" . " * " . s:cr
    call s:EndComments()
endfunction
