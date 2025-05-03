from pathlib import Path

readme_content = """# 📝 MLB Player Stats Analyzer (OSS1 - Project1)

## 📌 개요
이 프로젝트는 `2024_MLB_Player_Stats.csv` 파일을 기반으로, 선수들의 통계 정보를 조회하고 분석하는 Bash 스크립트입니다. 사용자 입력을 통해 다양한 조건의 분석을 실행할 수 있으며, 오픈소스 소프트웨어 개론 수업의 실습 과제로 제작되었습니다.

## 👨‍💻 정보
- **Student ID**: 12223711  
- **Name**: Shinhyuk Kim  
- **Course**: 오픈소스SW개론  
- **Semester**: 25-1학기

## ⚙️ 실행 방법
```bash
$ chmod +x 2025_OSS_Project1.sh
$ ./2025_OSS_Project1.sh 2024_MLB_Player_Stats.csv
📂 입력 파일
2024_MLB_Player_Stats.csv: MLB 선수들의 다양한 시즌 통계가 포함된 CSV 파일

📋 기능 설명
Search player stats by name
선수 이름으로 팀, 나이, WAR, HR, BA를 조회

List top 5 players by SLG
SLG 기준 상위 5명의 선수 출력 (규정 타석 이상)

Analyze team stats
특정 팀의 평균 나이, 총 홈런 수, 총 타점 출력

Compare by age groups
연령 그룹별로 SLG 기준 상위 5명 출력

Group A: 나이 < 25

Group B: 나이 25~30

Group C: 나이 > 30

Search by conditions
홈런 수, 타율 기준을 설정해 조건을 만족하는 선수 목록 출력

Generate performance report
팀의 전체 선수 성적 테이블과 총 선수 수를 포맷에 맞게 출력

Quit
종료

🧪 예시
vbnet
항상 세부 정보 표시

복사
Enter your COMMAND (1~7): 2
Do you want to see the top 5 players by SLG? (y/n): y

***Top 5 Players by SLG***
1. Aaron Judge (Team: NYY) - SLG: 0.634, HR: 52, RBI: 120
...
🔐 주의 사항
실행 시 반드시 인자로 .csv 파일을 전달해야 합니다.

CSV 파일이 존재하지 않거나 포맷이 맞지 않을 경우 오류 메시지를 출력합니다.

📎 제출 형태
Github에 Private 레포지토리로 업로드 후, README와 함께 제출

권한 설정 시 fine-grained token의 repo 및 contents: read/write 권한 부여 필요
"""

readme_path = Path("/mnt/data/README.md")
readme_path.write_text(readme_content, encoding="utf-8")

readme_path.name

