# LAB8 - 알뜰남녀
가성비 데이트 코스 앱 “알뜰남녀”는 연인, 친구들 사이의 약속에서 경제적인 부담을 줄여주고자 가볍게 즐길 수 있는 데이트 코스를 제안하는 앱입니다.

[동적 프로토타입 - 피그마](https://www.figma.com/file/FDoL8bJyHFRGA7dScMOUrR/Lab8_prototype?type=design&node-id=0-1&mode=design&t=yloNyOfp5vQdG4cd-0)
<details>
<summary>앱 프리뷰</summary>
<div markdown="1">
<img src="https://github.com/APP-iOS3rd/LAB8/blob/main/readme_asset/app_screenshot_01.png"  width="200" height="400">
<img src="https://github.com/APP-iOS3rd/LAB8/blob/main/readme_asset/app_screenshot_02.png"  width="200" height="400">
<img src="https://github.com/APP-iOS3rd/LAB8/blob/main/readme_asset/app_screenshot_03.png"  width="200" height="400">
<img src="https://github.com/APP-iOS3rd/LAB8/blob/main/readme_asset/app_screenshot_04.png"  width="200" height="400">
</div>
</details>

```
- 본인만의 데이트 코스를 작성 → 인스타 피드처럼 지역별 사람들의 데이트 코스를 구경할 수 있습니다.
- 가성비 좋은 음식점, 카페 추천, 경제적인 놀 거리 추천, 무료로 즐길 수 있는 다양한 활동을 검색할 수 있습니다.
```


## 프로젝트 필요성
물가 상승, 고금리와 같은 여러 경제 이슈로 인해 소비자들이 경제적인 압박을 느끼고 있습니다. 
특히 20, 30대들은 이로 인해 데이트 비용에 대한 부담이 커져서 연애, 친구와의 약속에 어려움을 겪고 있습니다. 
이런 상황에서 경제적으로 효율적이고 합리적인 데이트 옵션을 찾는 것이 많아졌으므로 그에 필요한 앱을 만들어보고자 제작하게 되었습니다.

## 차별점
- 사용자의 경제적인 상황을 고려하여 가격대로 필터 기능을 넣었습니다.
- 하루 데이트 코스에 필요한 음식, 카페, 다양한 활동(전시회, 팝업 스토어 등)를 종합적으로 모두 담았습니다.
- 날씨 API를 통해 해당 날씨에 적합한 데이트 장소(실내/실외)를 추천합니다.
- 사용자가 직접 데이트 코스를 작성하고, 다른 사람들의 코스를 탐색할 수 있습니다.

## 페이지 구성
#### 회원관리
> 개인정보를 담는 페이지
- 소셜 로그인 기능 구현
- 유저가 좋아요, 업로드한 게시물 확인 가능
- 설정 페이지에서 앱의 정보와 기타 정보를 확인 가능

|`시작 페이지(로그인)`|`마이페이지`|`설정 페이지`|
|-------|-------|-------|
|<img src="https://github.com/APP-iOS3rd/LAB8/blob/main/readme_asset/main.png"  width="180" height="380">|<img src="https://github.com/APP-iOS3rd/LAB8/blob/main/readme_asset/mypage.png"  width="180" height="380">|<img src="https://github.com/APP-iOS3rd/LAB8/blob/main/readme_asset/setting.png"  width="180" height="380">

#### 지역별 놀 거리 추천
> 카테고리 별로 맛집 카페 등 놀 거리를 추천
- 지역별 맛집, 놀 거리 추천
- 필터 기능으로 다양한 선택 기준을  제시
- 상세페이지에서 음식점, 카페에 대한 세부 정보를 제공

|`메인 페이지`|`게시판 페이지`|`게시판(필터)`| `상세 페이지(시설)`|
|-------|-------|-------|-------|
|<img src="https://github.com/APP-iOS3rd/LAB8/blob/main/readme_asset/home.png" width="180" height="380">|<img src="https://github.com/APP-iOS3rd/LAB8/blob/main/readme_asset/search.png"  width="180" height="380">|<img src="https://github.com/APP-iOS3rd/LAB8/blob/main/readme_asset/filter.png" width="180" height="380"> |<img src="https://github.com/APP-iOS3rd/LAB8/blob/main/readme_asset/setting.png"  width="180" height="380"> 

#### 코스 추천
> 가성비 코스를 추천받고 나만의 코스를 만드는 페이지
- 피드 형식으로 사진과 정보를 제공
- 검색 기능을 통해 특정 키워드 검색
- 이미지, 제목, 내용 입력이 가능한 글 작성 기능
- 맞춤형 코스와 리뷰를 직관적인 UI로 제공

|`피드(코스 추천)`|`검색 페이지(코스)`|`게시물 업로드(코스)`| `상세 페이지(코스)`|
|-------|-------|-------|-------|
|<img src="https://github.com/APP-iOS3rd/LAB8/blob/main/readme_asset/course.png" width="180" height="400">|<img src="https://github.com/APP-iOS3rd/LAB8/blob/main/readme_asset/course_search.png"  width="180" height="400">|<img src="https://github.com/APP-iOS3rd/LAB8/blob/main/readme_asset/written.png" width="180" height="400"> |<img src="https://github.com/APP-iOS3rd/LAB8/blob/main/readme_asset/post.png"  width="180" height="400"> 


