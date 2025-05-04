12223711 김신혁 학생의 25년 오픈소스SW개론 프로젝트1 과제입니다.

이 프로젝트는 MLB 선수들의 기록들을 담은 csv파일을 이용하여 선수들의 기록을 조회하고 정리하여 출력하는 bash 스크립트입니다.

프로그램을 실행하기 위해 ./2025_OSS_Project1.sh 2024_MLB_Player_Stats.csv 를 입력합니다.

아래는 이 프로그램의 기능설명입니다.

1.Search player stats by name
선수 이름으로 팀, 나이, WAR, HR, BA를 조회

2.List top 5 players by SLG
SLG 기준 상위 5명의 선수 출력 (규정 타석 이상)

3.Analyze team stats
특정 팀의 평균 나이, 총 홈런 수, 총 타점 출력

4.Compare by age groups
연령 그룹별로 SLG 기준 상위 5명 출력
Group A: 나이 < 25
Group B: 나이 25~30
Group C: 나이 > 30

5.Search by conditions
홈런 수, 타율 기준을 설정해 조건을 만족하는 선수 목록 출력

6.Generate performance report
팀의 전체 선수 성적 테이블과 총 선수 수를 포맷에 맞게 출력

7. Quit
종료

실행시에 반드시 같은 디렉토리에 csv 파일이 있어야합니다.
