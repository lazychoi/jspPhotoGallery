# 미니 프로젝트 - jsp로 갤러리 만들기

[동작 화면 보기](https://youtu.be/V7SJ47QyqA4)

- 기간: 2013. 1. 9 - 10. (2일)

## 어려웠던 점

- form으로 전송해야 request.getParameter()로 받을 수 있다. 보내는 쪽에서 form이 필요없으면 hidden으로 만들어 보내던가 세션이나 쿠키를 사용한다.
- 세션 정보를 int형으로 저장해서 불러오지 못했던 점 => 세션은 저장하는 쪽과 불러오는 쪽의 자료형이 같아야 한다. 그런데 세션을 불러올 때 Object 형을 반환하고 이를 바로 int로 변환할 수 없다. 따라서 int형으로 써야 할 때도 String으로 저장하고 String으로 불러서 사용해야 하는 것 같다.
- 파일 경로를 찾는 데 애를 먹어 사진이 나타나지 않았던 점 => DAO에서 html을 만들 때 파일 경로는 상대경로다. 따라서 현재 파일 위치(./)에서 시작한다.
- css 파일이 바로 반영되지 않아 HTML 태그에 바로 스타일을 적용한 점 => 검색에서 나온 대로 css 파일명을 바꾸고, 캐시를 지워도 바로 적용 됐다 안 됐다 한다. 
- 이클립스 문제인지 잘 실행되던 것이 안 되는가 하면 안 되던 것이 다시 되기도 한다. 정상 작동하는 데도 빨간 밑줄이 간 곳도 있다. 이럴 때는 정말 환장한다.
- 제대로 돌아가는 게시판을 구현하기에는 시간이 너무 촉박했던 점 등등

## 구현 못 한 것

- 게시글을 지우면 파일도 같이 삭제
- '좋아요' 버튼 누르면 오른쪽 위에 누른 횟수 띄우는 것 
- 예외 처리를 안 했다. 사용자의 예상치 못한 입력에 대응하지 않았다.

## 초기 화면

<img width="500" alt="index" src="https://user-images.githubusercontent.com/8787919/211489401-f238c26d-cb2b-44a3-b9c5-d7a321c9fe9a.png">

## 갤러리

- 세션 정보를 이용해 로그인 상태 확인

<img width="500" alt="gallery" src="https://user-images.githubusercontent.com/8787919/211489435-2db6338b-f071-45d8-a7d2-370e99269c80.png">

## 글 쓰기

<img width="500" alt="write" src="https://user-images.githubusercontent.com/8787919/211489486-30f69b02-ea55-4ce9-94a3-bb3865d2dfcd.png">

## 글 수정하기

- 로그인 한 사용자가 쓴 게시글만 수정 가능
- 다른 사용자가 쓴 글에는 수정, 삭제 버튼이 나타나지 않음

<img width="400" alt="update" src="https://user-images.githubusercontent.com/8787919/211489506-d21d9c90-3719-42ef-aec5-b6bd2619d177.png">  <img width="400" alt="update2" src="https://user-images.githubusercontent.com/8787919/211493577-c4bd1688-ed26-4c39-a0de-728810f32040.png">

## 회원 가입

<img width="205" alt="signin" src="https://user-images.githubusercontent.com/8787919/211490351-9a55891d-aa44-4611-b5c0-fd7f51bc55b8.png">


## 설문조사

<img width="300" alt="survey" src="https://user-images.githubusercontent.com/8787919/211490378-b3ee3622-ff69-4bc0-9c19-bf81a710064c.png"> <img width="200" alt="surveyresult" src="https://user-images.githubusercontent.com/8787919/211490389-bef790c7-9517-4059-abfa-5fab1a2c86bb.png">

