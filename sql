-- Members3 테이블 생성
CREATE TABLE Members3 (
    id VARCHAR(50),
    password VARCHAR(50),
    phoneNumber VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    address VARCHAR(100)
);

-- 데이터 삽입
INSERT INTO Members3 (id, password, phoneNumber, gender, age, address)
VALUES ('user123', 'password123', '010-1234-5678', 'male', 30, '123 Main Street');

-- animals3 테이블 생성
CREATE TABLE animals3 (
    member_id INT,
    animal_name VARCHAR(255),
    birth_year INT,
    animal_type VARCHAR(20),
    FOREIGN KEY (member_id) REFERENCES Members3(id)
);

-- 데이터 삽입
INSERT INTO animals3 (member_id, animal_name, birth_year)
VALUES (1, 'Max', 2020);

-- animal_type 업데이트
UPDATE animals3
SET animal_type = CASE
    WHEN birth_year > EXTRACT(YEAR FROM SYSDATE) - 1 THEN '어린 강아지'
    WHEN birth_year > EXTRACT(YEAR FROM SYSDATE) - 1.5 THEN '성장 중인 강아지'
    ELSE '성체 강아지'
END;

-- health_information3 테이블 생성
CREATE TABLE health_information3 (
    member_id INT,
    animal_name VARCHAR(255),
    breed_name VARCHAR(255),
    age_range VARCHAR(50),
    exercise_amount VARCHAR(255),
    disease VARCHAR(255),
    height_range INT,
    weight_range VARCHAR(255),
    FOREIGN KEY (member_id) REFERENCES Members3(id)
);

-- 데이터 삽입
INSERT INTO health_information3 (member_id, animal_name, breed_name, age_range, exercise_amount, disease, height_range, weight_range)
VALUES (1, 'Max', '골든 리트리버', '어린 강아지', '일일 약 30분에서 1시간 정도의 산책과 약간의 놀이 시간을 권장합니다.', '식욕 부진, 눈꺼풀 이완증', 45, '적정 몸무게 15-25kg');

-- 추가 데이터 삽입
INSERT INTO health_information3 (member_id, animal_name, breed_name, age_range, exercise_amount, disease, height_range, weight_range)
VALUES
    (1, 'Max', '골든 리트리버', '성장 중 강아지', '일일 약 1시간에서 2시간 정도의 산책과 활동적인 놀이 시간을 권장합니다.', '소화 문제, 피부 염증', 60, '적정 몸무게 25-35kg'),
    (1, 'Max', '골든 리트리버', '성년 강아지', '일일 약 2시간 이상의 산책과 활동이 풍부한 놀이 시간을 권장합니다.', '암, 고관절 질환', 61, '적정 몸무게 25-34kg'),
    (1, 'Max', '진돗개', '어린 강아지', '일일 약 30분에서 1시간 정도의 산책과 약간의 놀이 시간을 권장합니다.', '열사병, 관절 이상, 피부 문제', 40, '적정 몸무게 8-12kg'),
    (1, 'Max', '진돗개', '성장 중 강아지', '일일 약 1시간에서 2시간 정도의 산책과 활동적인 놀이 시간을 권장합니다.', '열사병, 관절 이상, 피부 문제', 55, '적정 몸무게 15-20kg'),
    (1, 'Max', '진돗개', '성년 강아지', '일일 약 2시간 이상의 산책과 활동이 풍부한 놀이 시간을 권장합니다.', '열사병, 관절 이상, 피부 문제', 60, '적정 몸무게 18-25kg'),
    (1, 'Max', '푸들', '어린 강아지', '일일 약 30분에서 1시간 정도의 산책과 약간의 놀이 시간을 권장합니다.', '식욕 부진, 구토와 설사', 33, '적정 몸무게 3-8kg'),
    (1, 'Max', '푸들', '성장 중 강아지', '일일 약 1시간에서 2시간 정도의 산책과 활동적인 놀이 시간을 권장합니다.', '피부 감염, 알레르기', 40, '적정 몸무게 7-15kg'),
    (1, 'Max', '푸들', '성년 강아지', '일일 약 2시간 이상의 산책과 활동이 풍부한 놀이 시간을 권장합니다.', '눈 및 귀 질환, 신장 질환', 38, '적정 몸무게 17-25kg'),
    (1, 'Max', '치와와', '어린 강아지', '일일 약 30분에서 1시간 정도의 산책과 약간의 놀이 시간을 권장합니다.', '호흡곤란, 장염', 18, '적정 몸무게 0.5-2kg'),
    (1, 'Max', '치와와', '성장 중 강아지', '일일 약 1시간에서 2시간 정도의 산책과 활동적인 놀이 시간을 권장합니다.', '피부 알레르기, 위장관 질환', 20, '적정 몸무게 1-2.5kg'),
    (1, 'Max', '치와와', '성년 강아지', '일일 약 2시간 이상의 산책과 활동이 풍부한 놀이 시간을 권장합니다.', '심장 질환, 관절 이상', 23, '적정 몸무게 13kg'),
    (1, 'Max', '말티즈', '어린 강아지', '일일 약 30분에서 1시간 정도의 산책과 약간의 놀이 시간을 권장합니다.', '식욕 부진, 구토와 설사', 22, '적정 몸무게 1.5-2.5kg'),
    (1, 'Max', '말티즈', '성장 중 강아지', '일일 약 1시간에서 2시간 정도의 산책과 활동적인 놀이 시간을 권장합니다.', '피부 문제, 턱 관절 이상', 25, '적정 몸무게 2-4kg'),
    (1, 'Max', '말티즈', '성년 강아지', '일일 약 2시간 이상의 산책과 활동이 풍부한 놀이 시간을 권장합니다.', '치아 문제, 심장 질환', 25, '적정 몸무게 3-4kg'),
    (1, 'Max', '불독', '어린 강아지', '일일 약 30분에서 1시간 정도의 산책과 약간의 놀이 시간을 권장합니다.', '호흡곤란, 장염', 35, '적정 몸무게 7-15kg'),
    (1, 'Max', '불독', '성장 중 강아지', '일일 약 1시간에서 2시간 정도의 산책과 활동적인 놀이 시간을 권장합니다.', '피부 알레르기, 위장관 질환', 40, '적정 몸무게 13-22kg'),
    (1, 'Max', '불독', '성년 강아지', '일일 약 2시간 이상의 산책과 활동이 풍부한 놀이 시간을 권장합니다.', '심장 질환, 관절 이상', 40, '적정 몸무게 18-25kg'),
    (1, 'Max', '저먼셰퍼드', '어린 강아지', '일일 약 30분에서 1시간 정도의 산책과 약간의 놀이 시간을 권장합니다.', '식욕 부진, 구토와 설사', 66, '적정 몸무게 22-40kg'),
    (1, 'Max', '저먼셰퍼드', '성장 중 강아지', '일일 약 1시간에서 2시간 정도의 산책과 활동적인 놀이 시간을 권장합니다.', '허리디스크, 고관절 이상', 66, '적정 몸무게 30-40kg'),
    (1, 'Max', '저먼셰퍼드', '성년 강아지', '일일 약 2시간 이상의 산책과 활동이 풍부한 놀이 시간을 권장합니다.', '염증성 장질환, 암', 65, '적정 몸무게 30-40kg'),
    (1, 'Max', '라브라도 리트리버', '어린 강아지', '일일 약 30분에서 1시간 정도의 산책과 약간의 놀이 시간을 권장합니다.', '비만, 고관절 이상', 58, '적정 몸무게 25-36kg'),
    (1, 'Max', '라브라도 리트리버', '성장 중 강아지', '일일 약 1시간에서 2시간 정도의 산책과 활동적인 놀이 시간을 권장합니다.', '피부 알레르기, 고관절 이상', 61, '적정 몸무게 27-36kg'),
    (1, 'Max', '라브라도 리트리버', '성년 강아지', '일일 약 2시간 이상의 산책과 활동이 풍부한 놀이 시간을 권장합니다.', '비만, 관절 이상', 61, '적정 몸무게 27-36kg');

-- Members3 테이블 조회
SELECT * FROM Members3;

-- animals3 테이블 조회
SELECT * FROM animals3;

-- health_information3 테이블 조회
SELECT * FROM health_information3;










CREATE TABLE Hotels (
  hotel_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  hotel_name VARCHAR(255), -- 호텔 이름
  location VARCHAR(255) -- 지역(종로, 중구, 용산, 동작, 관악, 서초, 강남, 송파, 강동) 태인님이랑 같이 정한 범위 호텔, 미용 둘 다 없는 구(용산, 동작, 강동)
);

INSERT INTO Hotels (hotel_name, location)
VALUES
  ('이을애견호텔', '용산'),
  ('편안하개', '동작'),
  ('아이뽀애견유치원호텔', '강동'),
  ('까르텔', NULL),
  ('프로독 애견호텔', NULL),
  ('개러리아 강남점', NULL);

CREATE TABLE 이을애견호텔 (
  member_id INT,  
  hotel_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  hotel_name VARCHAR(255), -- 이을애견호텔
  grade VARCHAR(255), -- 1, 2, 3
  details VARCHAR(225), -- 주차가능, 와이파이, 24시간 방문 가능, 유기농 간식 제공
  date DATE, -- 날짜(2023-07-10 ~ 2023-07-23)
  breed_name VARCHAR(255), -- 푸들, 말티즈, 치와와, 비숑, 리트리버
  dog_size VARCHAR(255), -- 소, 중, 대
  many INT, -- 1~5
  FOREIGN KEY (member_id) REFERENCES Members3(id)  
);

INSERT INTO 이을애견호텔 (member_id, hotel_name, grade, details, date, breed_name, dog_size, many)
VALUES
  (1, '이을애견호텔', '1', '주차가능, 와이파이, 24시간 방문 가능, 유기농 간식 제공', NULL, NULL, NULL, NULL),
  (1, '이을애견호텔', '1', '주차가능, 와이파이, 24시간 방문 가능, 유기농 간식 제공', NULL, NULL, NULL, NULL),
  (1, '이을애견호텔', '2', '주차가능, 와이파이, 유기농 간식 제공', NULL, NULL, NULL, NULL),
  (1, '이을애견호텔', '2', '주차가능, 와이파이, 유기농 간식 제공', NULL, NULL, NULL, NULL),
  (1, '이을애견호텔', '2', '주차가능, 와이파이, 유기농 간식 제공', NULL, NULL, NULL, NULL),
  (1, '이을애견호텔', '3', '주차가능, 와이파이', NULL, NULL, NULL, NULL),
  (1, '이을애견호텔', '3', '주차가능, 와이파이', NULL, NULL, NULL, NULL),
  (1, '이을애견호텔', '3', '주차가능, 와이파이', NULL, NULL, NULL, NULL),
  (1, '이을애견호텔', '3', '주차가능, 와이파이', NULL, NULL, NULL, NULL);

UPDATE 이을애견호텔
SET details = REPLACE(details, '주차가능', '주차불가능')
WHERE grade IN ('3');

CREATE TABLE 편안하개 (
  member_id INT,                  
  hotel_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  hotel_name VARCHAR(255), -- 편안하개
  grade VARCHAR(255), -- 1, 2, 3
  details VARCHAR(225), -- 주차가능, 와이파이, 24시간 방문 가능, 유기농 간식 제공
  date DATE, -- 날짜(2023-07-10 ~ 2023-07-23)
  breed_name VARCHAR(255), -- 푸들, 말티즈, 치와와, 비숑, 리트리버
  dog_size VARCHAR(255), -- 소, 중, 대
  many INT, -- 1~5
  FOREIGN KEY (member_id) REFERENCES Members3(id)
);

INSERT INTO 편안하개 (member_id, hotel_name, grade, details, date, breed_name, dog_size, many)
VALUES
  (1, '편안하개', '1', '주차가능, 와이파이, 24시간 방문 가능, 유기농 간식 제공', NULL, NULL, NULL, NULL),
  (1, '편안하개', '2', '주차가능, 와이파이', NULL, NULL, NULL, NULL),
  (1, '편안하개', '2', '주차가능, 와이파이', NULL, NULL, NULL, NULL),
  (1, '편안하개', '3', '주차가능, 와이파이', NULL, NULL, NULL, NULL),
  (1, '편안하개', '3', '주차가능, 와이파이', NULL, NULL, NULL, NULL),
  (1, '편안하개', '3', '주차가능, 와이파이', NULL, NULL, NULL, NULL);

CREATE TABLE 아이뽀애견유치원호텔 (
  member_id INT,                 
  hotel_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  hotel_name VARCHAR(255), -- 아이뽀애견유치원호텔
  grade VARCHAR(255), -- 1, 2, 3
  details VARCHAR(225), -- 주차가능, 와이파이, 24시간 방문 가능
  date DATE, -- 날짜(2023-07-10 ~ 2023-07-23)
  breed_name VARCHAR(255), -- 푸들, 말티즈, 치와와, 비숑, 리트리버
  dog_size VARCHAR(255), -- 소, 중, 대
  many INT, -- 1~5
  FOREIGN KEY (member_id) REFERENCES Members3(id)
);

INSERT INTO 아이뽀애견유치원호텔 (member_id, hotel_name, grade, details, date, breed_name, dog_size, many)
VALUES
  (1, '아이뽀애견유치원호텔', '1', '주차가능, 와이파이, 24시간 방문 가능, 유기농 간식 제공', NULL, NULL, NULL, NULL),
  (1, '아이뽀애견유치원호텔', '1', '주차가능, 와이파이, 24시간 방문 가능, 유기농 간식 제공', NULL, NULL, NULL, NULL),
  (1, '아이뽀애견유치원호텔', '2', '주차가능, 와이파이, 유기농 간식 제공', NULL, NULL, NULL, NULL),
  (1, '아이뽀애견유치원호텔', '2', '주차가능, 와이파이, 유기농 간식 제공', NULL, NULL, NULL, NULL),
  (1, '아이뽀애견유치원호텔', '2', '주차가능, 와이파이, 유기농 간식 제공', NULL, NULL, NULL, NULL),
  (1, '아이뽀애견유치원호텔', '3', '주차가능, 와이파이', NULL, NULL, NULL, NULL),
  (1, '아이뽀애견유치원호텔', '3', '주차가능, 와이파이', NULL, NULL, NULL, NULL),
  (1, '아이뽀애견유치원호텔', '3', '주차가능, 와이파이', NULL, NULL, NULL, NULL);

UPDATE 아이뽀애견유치원호텔
SET details = REPLACE(details, '주차가능', '주차불가능')
WHERE grade IN ('3');

CREATE TABLE 까르텔 (
  member_id INT,
  hotel_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  hotel_name VARCHAR(255), -- 까르텔
  grade VARCHAR(255), -- 1, 2, 3
  details VARCHAR(225), -- 주차가능, 와이파이, 유기농 간식 제공
  date DATE, -- 날짜(2023-07-10 ~ 2023-07-23)
  breed_name VARCHAR(255), -- 푸들, 말티즈, 치와와, 비숑, 리트리버
  dog_size VARCHAR(255), -- 소, 중, 대
  many INT, -- 1~5
  FOREIGN KEY (member_id) REFERENCES Members3(id)
);

INSERT INTO 까르텔 (member_id, hotel_name, grade, details, date, breed_name, dog_size, many)
VALUES
  (1, '까르텔', '2', '주차가능, 와이파이, 유기농 간식 제공', NULL, NULL, NULL, NULL),
  (1, '까르텔', '2', '주차가능, 와이파이, 유기농 간식 제공', NULL, NULL, NULL, NULL),
  (1, '까르텔', '2', '주차가능, 와이파이, 유기농 간식 제공', NULL, NULL, NULL, NULL),
  (1, '까르텔', '3', '주차가능, 와이파이, 유기농 간식 제공', NULL, NULL, NULL, NULL),
  (1, '까르텔', '3', '주차가능, 와이파이, 유기농 간식 제공', NULL, NULL, NULL, NULL);

DELETE FROM 까르텔
WHERE grade = '3' AND details LIKE '%유기농 간식 제공%';

CREATE TABLE 프로독애견호텔 (
  member_id INT,              
  hotel_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  hotel_name VARCHAR(255), -- 프로독 애견호텔
  grade VARCHAR(255), -- 등급(1, 2, 3)
  details VARCHAR(225), -- 주차가능, 와이파이, 24시간 방문 가능, 유기농 간식 제공
  date DATE, -- 날짜(2023-07-10 ~ 2023-07-23)
  breed_name VARCHAR(255), -- 강아지 종류(푸들, 말티즈, 치와와, 비숑, 리트리버) 이름
  dog_size VARCHAR(255), -- 강아지 사이즈(소, 중, 대)
  many INT, -- 강아지 수(1~5)
  FOREIGN KEY (member_id) REFERENCES Members3(id)              
);

INSERT INTO 프로독애견호텔 (member_id, hotel_name, grade, details, date, breed_name, dog_size, many)
VALUES
  (1, '프로독 애견호텔', '1', '주차가능, 와이파이, 24시간 방문 가능, 유기농 간식 제공', NULL, NULL, NULL, NULL),
  (1, '프로독 애견호텔', '1', '주차가능, 와이파이, 24시간 방문 가능, 유기농 간식 제공', NULL, NULL, NULL, NULL),
  (1, '프로독 애견호텔', '2', '주차가능, 와이파이', NULL, NULL, NULL, NULL),
  (1, '프로독 애견호텔', '3', '주차가능, 와이파이', NULL, NULL, NULL, NULL),
  (1, '프로독 애견호텔', '3', '주차가능, 와이파이', NULL, NULL, NULL, NULL);

DELETE FROM 프로독애견호텔
WHERE grade = '3' AND details LIKE '%주차가능%';

CREATE TABLE 개러리아강남점 (
  member_id INT,              
  hotel_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  hotel_name VARCHAR(255), -- 개러리아 강남점
  grade VARCHAR(255), -- 1, 2, 3
  details VARCHAR(225), -- 주차가능, 와이파이, 24시간 방문 가능, 유기농 간식 제공
  date DATE, -- 날짜(2023-07-10 ~ 2023-07-23)
  breed_name VARCHAR(255), -- 푸들, 말티즈, 치와와, 비숑, 리트리버
  dog_size VARCHAR(255), -- 소, 중, 대
  many INT, -- 1~5
  FOREIGN KEY (member_id) REFERENCES Members3(id)
);

INSERT INTO 개러리아강남점 (member_id, hotel_name, grade, details, date, breed_name, dog_size, many)
VALUES 
  (1, '개러리아 강남점', '1', '주차가능, 와이파이, 24시간 방문 가능, 유기농 간식 제공', NULL, NULL, NULL, NULL),
  (1, '개러리아 강남점', '2', '주차가능, 와이파이, 유기농 간식 제공', NULL, NULL, NULL, NULL),
  (1, '개러리아 강남점', '2', '주차가능, 와이파이, 유기농 간식 제공', NULL, NULL, NULL, NULL),
  (1, '개러리아 강남점', '3', '주차가능, 와이파이', NULL, NULL, NULL, NULL),
  (1, '개러리아 강남점', '3', '주차가능, 와이파이', NULL, NULL, NULL, NULL),
  (1, '개러리아 강남점', '3', '주차가능, 와이파이', NULL, NULL, NULL, NULL);

                
                





CREATE TABLE Grooming (
  grooming_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  grooming_name VARCHAR(255), -- 샵 이름
  location VARCHAR(255) -- 지역(종로, 중구, 용산, 동작, 관악, 서초, 강남, 송파, 강동) 태인님이랑 같이 정한 범위  호텔, 미용 둘 다 없는 구(용산, 동작, 강동)
);

INSERT INTO Grooming (grooming_name, location)
VALUES
  ('서촌도그살롱', '서울특별시 종로구 필운동 290 101호'),
  ('애뚜애뚜펫살롱', '서울특별시 중구 신당동 47-11 1.2층'),
  ('강아지마법사 골드맘', '서울특별시 중구 신당동 282-33 동심빌딩 1층 102호'),
  ('릴리줄리살롱', '서울 강남구 삼성로115길 42'),
  ('투퍼피', '서울 관악구 신림로 387 3층'),
  ('나나리펫하우스', '서울 강남구 논현로 70 2층'),
  ('루시몽', '서울 송파구 성내천로8길 3 2층');

CREATE TABLE 서촌도그살롱 (
  member_id INT,
  grooming_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  grooming_name VARCHAR(255), -- 서촌도그살롱
  services VARCHAR(255), -- '발톱 정리', '털 정리', '목욕', '전체 케어' // 1~3:갯수 선택, ALL:전체 선택
  details VARCHAR(225), -- 2시간 주차가능, 4시간 주차가능, 6시간 주차가능, 와이파이
  date DATE, -- 날짜(2023.07.10~2023.07.23)
  breed_name VARCHAR(255), -- 푸들, 말티즈, 치와와, 비숑, 리트리버
  dog_size VARCHAR(255), -- 소, 중, 대
  many INT, -- 1~5
  FOREIGN KEY (member_id) REFERENCES Members3(id)
);

INSERT INTO 서촌도그살롱 (grooming_name, services, details, date, breed_name, dog_size, many)
VALUES
  ('서촌도그살롱', '1', '와이파이', NULL, NULL, NULL, NULL),
  ('서촌도그살롱', '2', '2시간 주차가능, 와이파이', NULL, NULL, NULL, NULL),
  ('서촌도그살롱', '3', '4시간 주차가능, 와이파이', NULL, NULL, NULL, NULL),
  ('서촌도그살롱', 'ALL', '6시간 주차가능, 와이파이', NULL, NULL, NULL, NULL);

CREATE TABLE 애뚜애뚜펫살롱 (
  member_id INT,
  grooming_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  grooming_name VARCHAR(255), -- 애뚜애뚜펫살롱
  services VARCHAR(255), -- '발톱 정리', '털 정리', '목욕', '전체 케어', 1~3:갯수 선택, ALL:전체 선택
  details VARCHAR(225), -- 2시간 주차가능, 4시간 주차가능, 와이파이
  date DATE, -- 날짜(2023.07.10~2023.07.23)
  breed_name VARCHAR(255), -- 푸들, 말티즈, 치와와, 비숑, 리트리버
  dog_size VARCHAR(255), -- 소, 중, 대
  many INT, -- 1~5
  FOREIGN KEY (member_id) REFERENCES Members3(id)
);

INSERT INTO 애뚜애뚜펫살롱 (grooming_name, services, details, date, breed_name, dog_size, many)
VALUES
  ('애뚜애뚜펫살롱', '1', '2시간 주차가능, 와이파이', NULL, NULL, NULL, NULL),
  ('애뚜애뚜펫살롱', '2', '2시간 주차가능, 와이파이', NULL, NULL, NULL, NULL),
  ('애뚜애뚜펫살롱', '3', '4시간 주차가능, 와이파이', NULL, NULL, NULL, NULL),
  ('애뚜애뚜펫살롱', 'ALL', '6시간 주차가능, 와이파이', NULL, NULL, NULL, NULL);

DELETE FROM 애뚜애뚜펫살롱
WHERE services = '1' AND details LIKE '%2시간 주차가능%';

CREATE TABLE "강아지마법사 골드맘" (
  grooming_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  grooming_name VARCHAR(255), -- 강아지마법사 골드맘
  services VARCHAR(255), -- '발톱 정리', '털 정리', '목욕', '전체 케어', 1~3:갯수 선택, ALL:전체 선택
  details VARCHAR(225), -- 2시간 주차가능, 4시간 주차가능, 와이파이
  date DATE, -- 날짜(2023.07.10~2023.07.23)
  breed_name VARCHAR(255), -- 푸들, 말티즈, 치와와, 비숑, 리트리버
  dog_size VARCHAR(255), -- 소, 중, 대
  many INT -- 1~5
);

INSERT INTO "강아지마법사 골드맘" (grooming_name, services, details, date, breed_name, dog_size, many)
VALUES
  ('강아지마법사 골드맘', '1', '2시간 주차가능, 와이파이', NULL, NULL, NULL, NULL),
  ('강아지마법사 골드맘', '2', '2시간 주차가능, 와이파이', NULL, NULL, NULL, NULL),
  ('강아지마법사 골드맘', '3', '2시간 주차가능, 와이파이', NULL, NULL, NULL, NULL),
  ('강아지마법사 골드맘', 'ALL', '4시간 주차가능, 와이파이', NULL, NULL, NULL, NULL);

DELETE FROM "강아지마법사 골드맘"
WHERE services = '1' AND details LIKE '%2시간 주차가능%';

CREATE TABLE "릴리줄리살롱" (
  member_id INT,
  grooming_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  grooming_name VARCHAR(255), -- 릴리줄리살롱
  services VARCHAR(255), -- '발톱 정리', '털 정리', '목욕', '전체 케어', 1~3:갯수 선택, ALL:전체 선택
  details VARCHAR(225), -- 2시간 주차가능, 4시간 주차가능, 와이파이
  date DATE, -- 날짜(2023.07.10~2023.07.23)
  breed_name VARCHAR(255), -- 푸들, 말티즈, 치와와, 비숑, 리트리버
  dog_size VARCHAR(255), -- 소, 중, 대
  many INT, -- 1~5
  FOREIGN KEY (member_id) REFERENCES Members3(id)
);

INSERT INTO "릴리줄리살롱" (grooming_name, services, details, date, breed_name, dog_size, many)
VALUES
  ('릴리줄리살롱', '1', '2시간 주차가능, 와이파이', NULL, NULL, NULL, NULL),
  ('릴리줄리살롱', '2', '2시간 주차가능, 와이파이', NULL, NULL, NULL, NULL),
  ('릴리줄리살롱', '3', '4시간 주차가능, 와이파이', NULL, NULL, NULL, NULL),
  ('릴리줄리살롱', 'ALL', '4시간 주차가능, 와이파이', NULL, NULL, NULL, NULL);

CREATE TABLE "투퍼피" (
  member_id INT,
  grooming_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  grooming_name VARCHAR(255), -- 투퍼피
  services VARCHAR(255), -- '발톱 정리', '털 정리', '목욕', '전체 케어', 1~3:갯수 선택, ALL:전체 선택
  details VARCHAR(225), -- 2시간 주차가능, 4시간 주차가능, 와이파이
  date DATE, -- 날짜(2023.07.10~2023.07.23)
  breed_name VARCHAR(255), -- 푸들, 말티즈, 치와와, 비숑, 리트리버
  dog_size VARCHAR(255), -- 소, 중, 대
  many INT, -- 1~5
  FOREIGN KEY (member_id) REFERENCES Members3(id)
);

INSERT INTO "투퍼피" (grooming_name, services, details, date, breed_name, dog_size, many)
VALUES
  ('투퍼피', '1', '2시간 주차가능, 와이파이', NULL, NULL, NULL, NULL),
  ('투퍼피', '2', '2시간 주차가능, 와이파이', NULL, NULL, NULL, NULL),
  ('투퍼피', '3', '2시간 주차가능, 와이파이', NULL, NULL, NULL, NULL),
  ('투퍼피', 'ALL', '4시간 주차가능, 와이파이', NULL, NULL, NULL, NULL);

UPDATE "투퍼피"
SET details = REPLACE(details, '2시간 주차가능', '4시간 주차가능')
WHERE services IN ('3');

CREATE TABLE "나나리펫하우스" (
  member_id INT,
  grooming_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  grooming_name VARCHAR(255), -- 나나리펫하우스
  services VARCHAR(255), -- '발톱 정리', '털 정리', '목욕', '전체 케어', 1~3:갯수 선택, ALL:전체 선택
  details VARCHAR(225), -- 2시간 주차가능, 와이파이
  date DATE, -- 날짜(2023.07.10~2023.07.23)
  breed_name VARCHAR(255), -- 푸들, 말티즈, 치와와, 비숑, 리트리버
  dog_size VARCHAR(255), -- 소, 중, 대
  many INT, -- 1~5
  FOREIGN KEY (member_id) REFERENCES Members3(id)
);

INSERT INTO "나나리펫하우스" (grooming_name, services, details, date, breed_name, dog_size, many)
VALUES
  ('나나리펫하우스', '1', '와이파이', NULL, NULL, NULL, NULL),
  ('나나리펫하우스', '2', '와이파이', NULL, NULL, NULL, NULL),
  ('나나리펫하우스', '3', '2시간 주차가능, 와이파이', NULL, NULL, NULL, NULL),
  ('나나리펫하우스', 'ALL', '2시간 주차가능, 와이파이', NULL, NULL, NULL, NULL);

UPDATE "나나리펫하우스"
SET details = REPLACE(details, '2시간 주차가능', '4시간 주차가능')
WHERE services IN ('ALL');

CREATE TABLE "루시몽" (
  member_id INT,
  grooming_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  grooming_name VARCHAR(255), -- 루시몽
  services VARCHAR(255), -- '발톱 정리', '털 정리', '목욕', '전체 케어', 1~3:갯수 선택, ALL:전체 선택
  details VARCHAR(225), -- 4시간 주차가능, 6시간 주차가능, 와이파이
  date DATE, -- 날짜(2023.07.10~2023.07.23)
  breed_name VARCHAR(255), -- 푸들, 말티즈, 치와와, 비숑, 리트리버
  dog_size VARCHAR(255), -- 소, 중, 대
  many INT, -- 1~5
  FOREIGN KEY (member_id) REFERENCES Members3(id)
);

INSERT INTO "루시몽" (grooming_name, services, details, date, breed_name, dog_size, many)
VALUES
  ('루시몽', '1', '4시간 주차가능, 와이파이', NULL, NULL, NULL, NULL),
  ('루시몽', '2', '4시간 주차가능, 와이파이', NULL, NULL, NULL, NULL),
  ('루시몽', '3', '4시간 주차가능, 와이파이', NULL, NULL, NULL, NULL),
  ('루시몽', 'ALL', '6시간 주차가능, 와이파이', NULL, NULL, NULL, NULL);

UPDATE "루시몽"
SET details = REPLACE(details, '4시간 주차가능', '2시간 주차가능')
WHERE services IN ('1');








CREATE TABLE Hospitals 
(   
    member_id INT,
    hospital_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    location1 VARCHAR(255),
    location2 VARCHAR(255),
    name VARCHAR(255),
    details_location VARCHAR(255),
    site VARCHAR(255),
    tel VARCHAR(255),
    time VARCHAR(255),
   
    FOREIGN KEY (member_id) REFERENCES Members3(id)                          
);

INSERT INTO Hospitals (location1, location2, name, details_location, site, tel, time)
VALUES 
    ('서울', '강남', '츄츄동물병원', '서울 강남구 논현로67길 56', 'blog.naver.com/vetlucy', '02-512-0075', '매일 09:30~20:00'),
    ('서울', '강남', '예은동물병원', '서울 강남구 도곡로 189 (우)06257', 'blog.naver.com/sdvm', '02-529-5575', '수~토 10:00 ~ 21:00 월,화,일 10:00 ~ 18:00 월,화 휴게시간 13:00 ~ 14:00'),
    ('서울', '강남', '24시SNC동물메디컬센터', '서울 강남구 논현로 416 운기빌딩 1층 (우)06224', 'blog.naver.com/sncamc', '02-562-7582', '매일 00:00 ~ 24:00'),
    ('서울', '서초', '서초이음동물병원', '서울 서초구 효령러 347 서광빌딩1층', 'https://look360.kr/place/sciumah', '02-34747582', '매일10:00~20:00'),
    ('서울', '서초', 'VIP동물의료센터 서초점', '서울 서초구 동작대로36 대광빌딩1,2층', 'www.vipah.co.kr', '02-5253102', '매일 00:00 ~ 24:00'),
    ('서울', '서초', '반려동물의료센터 다울', '서울 서초구 효령로95 1층(우)06687', 'https://blog.naver.com/daul-ah', '02-3473-0911', '09:30~21:00'),
    ('서울', '송파', '24시샤인동물메디컬센터', '서울 송파구 오금로 147 JS빌딩 (우)05550', 'shineamc.com', '02-2088-7775', '매일 00:00 ~ 24:00'),
    ('서울', '송파', '도그마루동물병원', '서울 송파구 석촌호수로 104 1층 (우)05566', 'https://dmmdc.co.kr', '070-4349-3357', '매일 10:00 ~ 20:00'),
    ('서울', '송파', '에코동물병원', '서울 송파구 동남로 161 청공빌딩 101호 (우)05826', 'blog.naver.com/ecoanimal', '02-443-2222', '평일09:30~20:00 주말09:30~17:00'),
    ('서울', '관악', '와우종합동물병원', '서울 관악구 난곡로 247', 'null', '02-866-0880', '월~금 10:00 ~ 19:00 토10:00~17:00'),
    ('서울', '관악', '봉천현대동물병원', '서울 관악구 봉천로 520 3층', 'pf.kakao.com/_yquSxb', '02-878-9978', '평일10:00~19:00 토10:00~18:00'),
    ('서울', '관악', '러브펫종합동물병원', '서울 관악구 남부순환로 1429 (우)08766', 'https://blog.naver.com/pianogrl', '02-837-8875', '매일 10:00 ~ 20:00'),
    ('서울', '동작', '원동물병원', '서울 동작구 사당로 180 (우)07030', 'https://blog.naver.com/jjaem76', '02-587-5618', '평일10:00~18:00 토10:00~16:00'),
    ('서울', '동작', '보라매웰종합동물병원', '서울 동작구 상도로 16 MGI빌딩 1층 (우)07055', 'blog.naver.com/wellvc', '02-3280-7975', '평일09:00~20:30 토09:00~19:30 일13:00~18:30'),
    ('서울', '동작', '정겨운동물병원', '서울 동작구 상도로 315 (우)06970', 'blog.naver.com/friendlyac', '02-817-8172', '매일 10:00 ~ 20:00'),
    ('서울', '강동', '로얄동물메디컬센터 강동', '서울 강동구 천호대로 1171 1~3층', 'royalamcgd.com', '02-457-0075', '매일 00:00 ~ 24:00'),
    ('서울', '강동', '내품에동물병원', '서울 강동구 천호대로 1120 LIG건영 주상복합 102호 (우)05373', 'blog.naver.com/mylovehug', '02-477-1775', '월~토10:00~21:00'),
    ('서울', '강동', '길종합동물병원', '서울 동작구 사당로 180 (우)07030', 'https://www.bing.com', '02-484-0075', '평일10:00~19:00'),
    ('서울', '용산', '이태원동물병원', '서울 용산구 녹사평대로 210 1층', 'www.vetmedic.co.kr', '02-797-6677 ', '매일 09:00 ~ 18:00'),
    ('서울', '용산', '더힐동물의료센터', '서울 용산구 독서당로 81-1 3층 (우)04419', 'blog.naver.com/thehillvmc', '02-792-8275', '매일 00:00 ~ 24:00'),
    ('서울', '용산', '퍼스동물병원', '서울 용산구 신흥로 54 (우)04339', 'null', '02-790-7508', '뭘~토10:00~19:00'),
    ('서울', '중구', '애니컴메디컬센터', '서울 중구 다산로 83-1', 'https://www.anicomvet.com/', '02-2232-9702', '월~토 09:00 ~ 20:30'),
    ('서울', '중구', '웰튼동물병원', '서울 중구 난계로 197 1,2,4층 (우)04574', 'blog.naver.com/weltonamc2', '02-2253-2233', '매일 00:00 ~ 24:00'),
    ('서울', '중구', '메종동물병원', '서울 중구 다산로 230 하나빌딩 1층 (우)04585', 'blog.naver.com/maison_ah', '02-2038-7555', '월~토 09:00 ~ 20:00'),
    ('서울', '종로구', '우리동물병원', '서울 종로구 지봉로 96-3 (우)03108', 'http://woorieah.modoo.at/', '02-3676-1191 ', '월금 10:00~19:30 토12:00~17:00 일휴무'),
    ('서울', '종로구', '올리브동물병원', '서울 종로구 자하문로 305 (우)03021', 'olivehospital.modoo.at', '02-391-7502', '매일10:00~20:00'),
    ('서울', '종로구', '누리봄동물병원', '서울 종로구 사직로12길 2', 'https://blog.naver.com/nuribom_', '02-735-7530', '평일09:30~19:30 토10:00~16:00 일 휴무');

DELETE FROM Hospitals
WHERE name = '길종합동물병원' AND site LIKE '%https://www.bing.com%';

UPDATE Hospitals
SET details_location = REPLACE(details_location, 'details_location', '서울 동작구 사당로 180 (우)07030')
WHERE details_location LIKE '%details_location%';








CREATE TABLE Travel (
    destination_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    member_id INT,
    date1 VARCHAR(255),
    date2 VARCHAR(255),
    location VARCHAR(255),
    name VARCHAR(255),
    address VARCHAR(255),
    review VARCHAR(255),
    details VARCHAR(255),
    FOREIGN KEY (member_id) REFERENCES Members3(id)
);

INSERT INTO Travel (date1, date2, location, name, address, review)
VALUES
    ('상시개방', NULL, '서울', '한강 공원', '서울특별시 여의도동', NULL),
    ('상시개방', NULL, '서울', '남산 공원', '서울특별시 중구 남산동', NULL),
    ('상시개방', NULL, '서울', '선유도 공원', '서울특별시 영등포구 선유로 343', NULL),
    ('상시개방', NULL, '서울', '용산 가족공원', '서울특별시 용산구 우사단로 99', NULL),
    ('상시개방', NULL, '서울', '서울숲', '서울특별시 성동구 성수동 1가', NULL),
    ('상시개방', NULL, '경기', '대부도 해수욕장', '인천광역시 강화군 대부면 외도로 168-15', NULL),
    ('상시개방', NULL, '경기', '강화도 해수욕장', '인천광역시 강화군 강화읍 강화대로 574-42', NULL),
    ('상시개방', NULL, '경기', '팔당댐', '경기도 남양주시 조안면 팔당로 409-1', NULL),
    ('상시개방', NULL, '경기', '경춘선숲길', '경기도 평택시 도곡면 사우중로 1359', NULL),
    ('상시개방', NULL, '경기', '평택해양도립공원', '인천광역시 연수구 센트럴로 123', NULL),
    ('상시개방', NULL, '인천', '송도 센트럴파크', '서울특별시 여의도동', NULL),
    ('상시개방', NULL, '인천', '왕산해수욕장', '인천광역시 중구 우현로 15', NULL),
    ('상시개방', NULL, '인천', '인천 대공원원', '인천광역시 남동구 석정로 134', NULL),
    ('상시개방', NULL, '인천', '인천 차이나타운', '인천광역시 중구 차이나타운로 60', NULL),
    ('상시개방', NULL, '인천', '인천 서해야생도립공원', '인천광역시 강화군 화도면 해안남로 297', NULL),
    ('상시개방', NULL, '강원', '남이섬', '강원도 속초시 강원대로 434번길 39', NULL),
    ('상시개방', NULL, '강원', '설악산 국립공원', '강원도 강릉시 설악로 170번길 328', NULL),
    ('상시개방', NULL, '강원', '오션월드', '경기도 화성시 남양읍 오션월드로 270', NULL),
    ('상시개방', NULL, '강원', '강릉 경포해수욕장', '강원도 강릉시 경포로 407', NULL),
    ('상시개방', NULL, '강원', '속초 해변', '강원도 속초시 번영로 376', NULL),
    ('상시개방', NULL, '광주', '광주호 호수공원', '광주광역시 광산구 첨단중앙로 167번길 76', NULL),
    ('상시개방', NULL, '광주', '무등산 국립공원', '전라남도 광양시 도포면 무등산로 2188', NULL),
    ('상시개방', NULL, '광주', '광주 문화전당', '광주광역시 동구 필문대로 11', NULL),
    ('상시개방', NULL, '광주', '금남로 벚꽃길', '광주광역시 서구 금남로', NULL),
    ('상시개방', NULL, '광주', '광주 동명동 예술촌', '광주광역시 동구 남동대로 54번길 8-9', NULL),
    ('상시개방', NULL, '제주', '협재해변', '제주특별자치도 제주시 한림읍 협재로 202', NULL),
    ('상시개방', NULL, '제주', '성산일출봉', '제주특별자치도 서귀포시 성산읍 일출로 284-12', NULL),
    ('상시개방', NULL, '제주', '한라산 국립공원', '제주특별자치도 서귀포시 성산읍 일주동로 1139-8', NULL),
    ('상시개방', NULL, '제주', '서귀포 올레시장', '제주특별자치도 서귀포시 남성로 52', NULL),
    ('상시개방', NULL, '제주', '사려니숲길', '제주특별자치도 제주시 조천읍 선진길 144', NULL),
    ('상시개방', NULL, '부산', '해운대 해수욕장', '부산광역시 해운대구 해운대해변로 264', NULL),
    ('상시개방', NULL, '부산', '광안리 해수욕장', '부산광역시 수영구 광안해변로 219', NULL),
    ('상시개방', NULL, '부산', '동백섬', '강원도 춘천시 소양로 26번길 42-12', NULL),
    ('상시개방', NULL, '부산', '송정해수욕장', '부산광역시 기장군 기장읍 송정해변로 59', NULL),
    (NULL, NULL, '부산', '롯데월드', '부산광역시 기장군 기장읍 송정해변로 59', NULL),
    ('상시개방', NULL, '부산', '태종대', '부산광역시 영도구 태종대로 24', NULL);

DELETE FROM Travel
WHERE date1 = '상시개방' AND date2 = 'NULL' AND location = '부산' AND name = '롯데월드' AND address = '부산광역시 기장군 기장읍 송정해변로 59' AND review = 'NULL';

UPDATE Travel
SET date1 = '상시개방'
WHERE date1 LIKE '%date1%';





                
      CREATE TABLE Restaurant (
    destination_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    member_id INT,
    date1 VARCHAR(255),
    date2 VARCHAR(255),
    location VARCHAR(255),
    name VARCHAR(255),
    address VARCHAR(255),
    tel VARCHAR(255),
    review VARCHAR(255),
    FOREIGN KEY (member_id) REFERENCES Members3(id)
);

INSERT INTO Restaurant (date1, date2, location, name, address, tel, review)
VALUES
    ('08:00', NULL, '서울', '필독', '서울 강서구 공항대로46길 81 5층', '02-6081-7272', NULL),
    ('09:00', NULL, '서울', '달마시안', '서울 강남구 압구정로42길 42', '0507-1491-0926', NULL),
    ('07:30', NULL, '서울', 'Summer Lane', '서울 용산구 이태원로55가길 49 1층 summerlane', '02-792-8114', NULL),
    ('09:00', NULL, '서울', '더 왓에버', '서울 강서구 마곡중앙2로 15 1층 115-119호', '02-6952-8577', NULL),
    ('10:00', NULL, '서울', '서울노마드', '서울 성북구 동소문로11길 5', '0507-1334-8049', NULL),
    ('10:00', NULL, '경기', '로이테', '경기 남양주시 조안면 북한강로 866 카페로이테', '0507-1445-2000', NULL),
    ('11:00', '수요일', '경기', '달빛새 베이커리앤카페', '경기 남양주시 진접읍 금강로782번길 292-21', '0507-1386-0341', NULL),
    ('11:00', NULL, '경기', '노만주의', '경기 고양시 덕양구 호국로1539번길 9-9 노만주의', '070-8810-0670', NULL),
    ('10:30', NULL, '경기', '그린그라스', '경기 성남시 분당구 석운로202번길 1 카페 그린그라스', '0507-1313-7065', NULL),
    ('11:00', NULL, '경기', 'PPK 키친', '경기 수원시 팔달구 인계로124번길 27-18 신일빌딩 1층', '0507-1346-9839', NULL),
    ('10:00', NULL, '강원', '감자밭', '강원 춘천시 신북읍 신샘밭로 674', '1566-3756', NULL),
    ('11:00', NULL, '강원', '엔드 투 앤드', '강원 강릉시 창해로 245', '0507-1491-7724', NULL),
    ('10:00', NULL, '강원', '홍시', '강원 홍천군 서면 팔봉산로 96 홍시', '0507-1315-0339', NULL),
    ('10:00', NULL, '강원', '카페도즈오프', '강원 원주시 신림면 신림황둔로 1060 1층', '0507-1330-1913', NULL),
    ('11:30', '월요일', '강원', '세레니타', '강원 강릉시 율곡로 3034 세레니타', '0507-1369-3475', NULL),
    ('10:50', NULL, '광주', '카페 체리쉬', '광주 서구 시청서편로4번길 5 1층 카페체리쉬', '0507-1414-8471', NULL),
    ('12:30', '월요일', '광주', '와우와우', '광주 북구 하서로483번길 8 1층', '0507-1302-4542', NULL),
    ('08:00', '월요일', '광주', '플랜티 광천점', '광주 서구 죽봉대로 68 1층 103호', '070-4647-1885', NULL),
    ('10:50', '월요일', '광주', '딸고라떼 신창점', '광주 광산구 장신로 280-16 딸고라떼', '0507-1391-9133', NULL),
    ('09:00', NULL, '제주', '제주카페 브라보비치 성산일출봉', '제주 서귀포시 성산읍 해맞이해안로 2614 1층', '0507-1310-8448', NULL),
    ('10:00', NULL, '제주', '너븐', '제주 서귀포시 칠십리로214번길 26 너븐', '010-5714-8549', NULL),
    ('11:00', NULL, '제주', '월정리 달이뜨는식탁', '제주 제주시 구좌읍 월정1길 14 1층', '0507-1330-8538', NULL),
    ('10:00', '화요일', '제주', '푸르곤', '제주 제주시 애월읍 납읍로 84 푸르곤', '0507-1381-8358', NULL),
    ('10:00', NULL, '제주', '휴일로', '제주 서귀포시 안덕면 난드르로 49-65', '010-7577-4965', NULL),
    ('09:00', NULL, '부산', '모치플레지르', '부산 수영구 수영로545번길 17-17', '부산 수영구 수영로545번길 17-17', NULL),
    ('12:00', NULL, '부산', '웨드', '부산 부산진구 서전로67번길 6 1층 A', '0507-1368-6260', NULL),
    ('11:00', NULL, '부산', '복합성', '부산 남구 진남로36번길 2 2층', '0507-1384-1677', NULL),
    ('11:00', NULL, '부산', 'BADA', '부산 기장군 일광읍 이천길 21', '0507-1364-4515', NULL),
    ('12:00', NULL, '부산', '프리윌 피자', '부산 부산진구 전포대로224번길 26 1층 프리윌', '0507-1319-0985', NULL);


                                    

                -- 쇼핑물품 테이블
CREATE TABLE ShoppingItems (
    item_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    member_id INT,
    name VARCHAR(300),
    price VARCHAR(300),
    img VARCHAR(300),
    category VARCHAR(50),
    many VARCHAR(255),
    details VARCHAR(255),
    FOREIGN KEY (member_id) REFERENCES Members3(id)                
);
INSERT INTO ShoppingItems (member_id, name, price, img, category, many, details)
VALUES 
                                ('로반 잘먹잘싸 전연령 강아지 사료', '44,500원', 'https://thumbnail8.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/725767035310288-fed7017e-3d9a-4074-9e38-6aa487d35ac1.jpg', '1', '99', '건사료'),
                                ('탐사 6free 강아지 사료 연어 레시피', '29,990원', 'https://thumbnail9.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/7295993519305983-34d2ca7f-5ca8-4a5e-ba39-b9776d147b49.jpg', '1', '99', '건사료'),
                                ('뉴트리나울트라 전연령 울트라 액티브 건식사료', '26,060원', 'https://thumbnail10.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/1656145509574667-71319138-0a3d-4e74-8db6-930253fd6a6f.jpg', '1', '99', '건사료'),
                                ('라무달리 전연령 강아지 금동사료', '40,750원', 'https://thumbnail9.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/469199796625972-350e3049-1c87-40ad-8718-c75da101b2ed.jpg', '1', '99', '건사료'),
                                ('나우프레쉬 그레인프리 스몰브리드 어덜트 사료', '33,350원', 'https://thumbnail9.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/4274031590551760-70458923-abd8-4338-be50-40a2d00a09b4.jpg', '1', '99', '건사료'),
                                ('ANF 전연령 독 식스프리 블루 연어 건식사료', '38,310원', 'https://thumbnail8.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/1856206705084389-65805338-121a-486c-b798-8b2647fd74b0.jpg', '1', '99', '건사료'),
                                ('이즈칸 독 알러지프리', '27,650원', 'https://thumbnail10.coupangcdn.com/thumbnails/remote/230x230ex/image/product/image/vendoritem/2019/03/13/3020066026/a71102b8-879f-4627-93d2-9a36b65d278f.jpg', '1', '99', '건사료, 알러지예방'),
                                ('소프트밥 전연령 증기로 찐 사료', '32,900원', 'https://thumbnail9.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/944053186817731-7a69bfbb-fed4-492b-8d5b-a3a506f86ad2.jpg', '1', '99', '습식사료'),
                                ('네츄럴랩 강아지 전연령 유기농 70% 6제로 PLUS 02 사료 소고기', '58,500원', 'https://www.coupang.com/vp/products/7063678619?itemId=17503328661&vendorItemId=84670639028&sourceType=srp_product_ads&clickEventId=222fddb6-fef5-4eeb-b3fa-2b7bf7ca5973&korePlacement=15&koreSubPlacement=12&q=%EA%B0%95%EC%95%84%EC%A7%80+%EA%B1%B4%EC%82%AC%EB%A3%8C&itemsCount=36&searchId=abd910b9014047e28564bb297d271775&rank=11&isAddedCart=', '1', '99', '건사료, 유기농'),
                                ('하이독 케어브이 강아지 종합 처방식 멀티프 사료 (냉동)', '19,700원', 'https://thumbnail10.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2022/07/12/10/0/5fb1ae37-3875-424a-8340-ebe21d3eb433.jpg', '1', '99', '습식사료'),
                                ('시저 버라이어티팩 반려동물 습식사료 6종 x 2p 세트', '18,900원', 'https://www.coupang.com/vp/products/294787069?itemId=929945044&vendorItemId=5307507664&q=%EA%B0%95%EC%95%84%EC%A7%80+%EC%8A%B5%EC%8B%9D%EC%82%AC%EB%A3%8C&itemsCount=36&searchId=fb88140df99b4202a8b6dc4437a2cc57&rank=6&isAddedCart=', '1', '99', '습식사료'),
                                ('한끼뚝딱 황태와 소고기 반려동물 습식사료', '34,900원', 'https://thumbnail8.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2887577580576916-2768ce93-33db-42d5-94c4-7c2cd786f2fe.jpg', '1', '99', '습식사료'),
                                ('더독 노령견용 닥터소프트 명작 하이퍼 습식 사료', '22,000원', 'https://www.coupang.com/vp/products/4629518740?itemId=5747490909&vendorItemId=73046129123&sourceType=SDW_TOP_SELLING_WIDGET_V2&searchId=fb88140df99b4202a8b6dc4437a2cc57&q=%EA%B0%95%EC%95%84%EC%A7%80%20%EC%8A%B5%EC%8B%9D%EC%82%AC%EB%A3%8C&isAddedCart=', '1', '99', '습식사료'),
                                ('뉴트리나울트라 전연령 곡물 진도 애견사료', '16,750원', 'https://www.coupang.com/vp/products/1256757?itemId=26857818&vendorItemId=3000153274&q=%EA%B0%95%EC%95%84%EC%A7%80+%EC%8A%B5%EC%8B%9D%EC%82%AC%EB%A3%8C&itemsCount=36&searchId=fb88140df99b4202a8b6dc4437a2cc57&rank=32&isAddedCart=', '1', '99', '습식사료'),
                                ('도비 6세 이상의 선견용 애견사료', '17,790원', 'https://thumbnail10.coupangcdn.com/thumbnails/remote/230x230ex/image/product/image/vendoritem/2019/03/12/3009347734/1332507b-feb1-4f8e-8e02-f238e67f3f50.jpg', '1', '99', '습식사료'),
                                ('도비 진 애견사료', '16,370원', 'https://thumbnail7.coupangcdn.com/thumbnails/remote/292x292ex/image/product/image/vendoritem/2019/03/21/3000243501/d75b241f-c6dc-46e8-8e8f-be16d4d0dc2e.jpg', '1', '99', '습식사료'),
                                ('인터펫코리아 양고기 도비 애견사료', '20,110원', 'https://thumbnail9.coupangcdn.com/thumbnails/remote/292x292ex/image/product/image/vendoritem/2019/03/18/3009347755/7531fcfe-071b-4706-831b-534d36756dd5.jpg', '1', '99', '습식사료'),
                                ('도비 스페셜 강아지사료', '19,480원', 'https://thumbnail7.coupangcdn.com/thumbnails/remote/292x292ex/image/product/image/vendoritem/2019/02/20/3000243582/01c45046-0878-48ad-a651-2a0e5fc54e10.jpg', '1', '99', '습식사료'),
                                ('도비 어덜트 곡물 작은입자 반려견 사료', '22,590원', 'https://thumbnail10.coupangcdn.com/thumbnails/remote/292x292ex/image/product/image/vendoritem/2019/02/19/3000236120/da0dc0df-d335-46e4-ae1a-d61eb5166e2b.jpg', '1', '99', '습식사료'),
                                ('웰비스타 하이디 진도8kg 1+1+간식 진도견사료 진돗개사료 강아지사료 개사료', '28,800원', 'https://thumbnail6.coupangcdn.com/thumbnails/remote/292x292q65ex/image/vendor_inventory/6a77/7ca730d48b4f1276c9250a4f63d307d1f953354a48bf7bb9ab48f2d9248b.jpg', '1', '99', '습식사료'),
                                ('반려소반 강아지 수제 간식', '17,950원', 'https://thumbnail9.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/536036565130725-5f341a43-7e4d-4c77-80f1-8390e958d7ee.png', '2', '99', '간식,황태포,수제'),
                                ('펫츠맘마 국내산 강아지 수제간식 200g', '16,900원', 'https://thumbnail10.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/9026143370547780-e2ada136-5e43-457e-b8ba-a465105636f3.png', '2', '99', '간식,황태포,무염'),
                                ('굿데이 건강한 육포 칩 강아지 간식 300g', '11,070원', 'https://thumbnail8.coupangcdn.com/thumbnails/remote/230x230ex/image/rs_quotation_api/vhn33ex1/6e19d460c22c45fb8d5d606e4c45cd45.jpg', '2', '99', '간식,육포,참치'),
                                ('수제핫도그 강아지 간식 5종 콤보팩 100g x 10p', '20,420원', 'https://thumbnail9.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2019/07/01/20/0/d7bab951-e06a-4a99-bee9-ba4209196ee2.jpg', '2', '99', '간식,육포,소고기,닭고기,양고기,연어,오리,수제'),
                                ('굿데이 건강한육포 반려견간식 300g', '11,500원', 'https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/product/image/vendoritem/2018/12/13/3707467603/61a3585a-ac76-46bf-8f51-d7c10a17bac4.jpg', '2', '99', '간식,육포,닭고기,닭가슴살'),
                                ('백프로고구마 강아지 비건 고구마 말랭이 간식 125g', '10,300원', 'https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/5316629283780701-b5e38a16-43f2-4c88-a2c3-9f4f9039d244.jpg', '2', '99', '간식,고구마'),
                                ('참좋은간식 그대로 말랑 스틱 고구마 건조간식 250g', '14,040원', 'https://thumbnail7.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2020/07/23/15/3/5d1b62f6-7470-443d-a1fe-3f3066e6b64e.jpg', '2', '99', '간식,고구마'),
                                ('앱솔루트바이트 자연건조 반려견간식 1kg', '19,160원', 'https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/product/image/vendoritem/2019/01/14/3847399503/a8af7d2b-aba2-4285-8cc3-4417b58f199c.jpg', '2', '99', '간식,고구마'),
                                ('뿌와캔디 국견간식 국내산 관절&눈&피부 강아지 간식 250g', '24,000원', 'https://thumbnail10.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/5515/d27844f9353c5e9b6a8a7863aa6b642311bda543f21d1ecb15f0210973d0.png', '2', '99', '간식,연어,참치'),
                                ('ANF 로하이드 화이트 밀크스틱 50p', '6,940원', 'https://thumbnail9.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2019/10/01/18/0/b6836211-aca6-4104-b003-eed218d19692.jpg', '2', '99', '간식,개껌'),
                                ('펫더맨 마이도기 강아지 간식 300g', '15,960원', 'https://thumbnail10.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/4088622386649564-073eb392-f899-4a87-b2dd-3e40cdcaadb1.jpg', '2', '99', '간식,개껌,닭가슴살,닭고기'),
                                ('멍도락 국내산 수제껌 연어고구마 블루베리츄 강아지 고양이 수제간식', '29,700원', 'https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/3342/a83f72d30b1228ad287e6ae4f80d4da36ac76c57feb1bd5ebbde76317a5e.jpg', '2', '99', '간식,개껌,과일,블루베리,수제'),
                                ('강아지 Think your dog teeth 소가죽우유껌 소형 250g 18p', '13,300원', 'https://thumbnail8.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2022/12/28/17/9/f751993e-8621-4ebf-9129-a60d691ae0f7.jpg', '2', '99', '간식,개껌'),
                                ('네츄럴이엑스 육포츄 스페셜 강아지 건조 간식', '24,400원', 'https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/4691557046059356-fb842a91-7a80-4fe5-a3dd-ad59267aa37b.jpg', '2', '99', '간식,육포,닭'),
                                ('냥품멍품 강아지 멍티슈 노즈워크 장난감', '13,900원', 'https://thumbnail10.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/259366055437416-523a169b-796e-4604-85d1-f2292a9408f8.jpg', '3', '99', '장난감'),
                                ('리스펫 강아지 장난감 파스텔러버 로프 6종세트', '8,720원', 'https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2877583436336942-2e1473d2-6b7c-4f13-a218-dbf25d94a59f.jpg', '3', '99', '장난감'),
                                ('딩동펫 반려동물 놀이방 인형 7종 세트', '9,540원', 'https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/rs_quotation_api/5tmllicw/a0a629a3d6fc4d1190d4d8f6da0b1752.jpg', '3', '99', '장난감'),
                                ('탐사 반려동물 강아지 장난감 야채&과일 인형 7종 세트', '8,290원', 'https://thumbnail7.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/463611429358685-1349fffe-b743-422a-b137-97460fe7e0ce.jpg', '3', '99', '장난감'),
                                ('크래킷 푸시 퍼즐 노즈워크 강아지 지능개발 분리불안 장난감', '24,900원', 'https://thumbnail9.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/efbe/5969e562dc867ca9cb0655977378b179adf58e1115e7b2464b11f689a64d.png', '3', '99', '장난감'),
                                ('소심한호랑이 코박이 강아지 장난감 노즈워크 매트 원형', '28,600원', 'https://thumbnail10.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/1576824547380290-a8506474-64d4-4c73-a52f-f34261207a61.jpg', '3', '99', '장난감'),
                                ('펫토리아 강아지 터그놀이 소시지와 케찹 장난감 세트', '15,490원', 'https://thumbnail9.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/7706405455122796-8a6061a4-1ae8-4bfd-abdb-26f6e22a4886.jpg', '3', '99', '장난감'),
                                ('크림펫 강아지 노즈워크 당근 농장 뽑기 밭 장난감 세트 ', '19,100원', 'https://thumbnail9.coupangcdn.com/thumbnails/remote/230x230ex/image/rs_quotation_api/hif3sn8u/3084562bcc94483ea1398dde7e6e4bcf.jpg', '3', '99', '장난감'),
                                ('[강아지특공대] 강아지 우드스틱 커피나무 이갈이 장난감', '10,200원', 'https://thumbnail10.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/d79d/92cbcfeb05fddfbc861ebe50b3c686752cec2473998f8d350f183086461c.png', '3', '99', '장난감'),
                                ('붐붐포 강아지 고슴도치 노즈워크 볼 장난감', '14,800원', 'https://www.coupang.com/vp/products/6748357373?itemId=15774835156&vendorItemId=82988106054&q=%EA%B0%95%EC%95%84%EC%A7%80+%EC%9E%A5%EB%82%9C%EA%B0%90&itemsCount=36&searchId=bf8c8cb1d3994ea38e07183250e71c98&rank=12&isAddedCart=', '3', '99', '장난감'),
                                ('도그아이 강아지장난감 쭉쭉이 돼지 + 코끼리 + 오리', '4,200원', 'https://thumbnail8.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/345438959366397-fb4e25ea-869d-432e-b081-face34adca96.png', '3', '99', '장난감'),
                                ('딩동펫 반려동물 우주 말랑토이 6종 세트', '7,820원', 'https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/rs_quotation_api/oew5aqmk/a14dab10f6514975a7ef63b6cc5c9459.jpg', '3', '99', '장난감'),
                                ('디지티 강아지 천방지축 장난감', '7,960원', 'https://thumbnail10.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2021/06/22/18/4/d42b4910-dbea-48e3-9726-51c50a2096d8.jpg', '3', '99', '장난감'),
                                ('코멧 펫 강아지 로프 장난감 6종 세트', '8,390원', 'https://thumbnail10.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/4677471381868255-a6fe32fe-a35b-45b9-b322-c4b69a0635c6.jpg', '3', '99', '장난감'),
                                ('딩동펫 반려동물 대발이 애착인형', '7,500원', 'https://thumbnail8.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/515891794620688-5533b808-cea8-40cc-9b77-c08344b1873a.jpg', '3', '99', '장난감'),
                                ('코멧 펫 라텍스볼 강아지 장난감 2종 세트', '5,990원', 'https://thumbnail8.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/1284366457660533-49705c8f-b613-4986-8302-b2a5831cc060.jpg', '3', '99', '장난감'),
                                ('고구마밭 노즈워크 강아지 장난감', '23,350원', 'https://thumbnail9.coupangcdn.com/thumbnails/remote/230x230ex/image/rs_quotation_api/z4aaxjut/d7b6a3e45f704c549fd4ad6e98bac4ab.png', '3', '99', '장난감'),
                                ('냥품멍품 잘풀리는 댕댕이네 노즈워크 강아지 장난감', '13,140원', 'https://thumbnail7.coupangcdn.com/thumbnails/remote/230x230ex/image/rs_quotation_api/fujlnl7v/2e664526fd154260b7f61436128a782c.jpg', '3', '99', '장난감'),
                                ('바이랩 스킨 밸런스 버블 강아지 샴푸 바로거품 저자극 약용 목욕 각질 린스 샴푸 320ml 1세트', '23,900원', 'https://thumbnail10.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/9e18/93922deb636e9636c55083101f9bda0972116e05c46edeecf5ec3eb608c9.png', '4', '99', '강아지 샴푸,머스크향,비듬,트러블케어'),
                                ('닥터블랭크 저자극 강아지 샴푸 베이비파우더향', '14,900원', 'https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2414691113593009-97b7d90e-6ada-4d0d-9f51-dfc0192180e4.jpg', '4', '99', '강아지 샴푸,파우더향,진정,보습'),
                                ('휘슬 허브4 약용 반려동물 샴푸', '8,820원', 'https://thumbnail7.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/1835813682781159-f436945a-94f1-4936-945b-0bb384bcc28c.jpg', '4', '99', '강아지 샴푸'),
                                ('휘슬 샤이닝 실키 애견샴푸', '7,090원', 'https://thumbnail8.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/1947390968328490-515f89dd-14ef-4c28-8584-7f397412c1e9.jpg', '4', '99', '강아지 샴푸'),
                                ('리스펫랩 반려동물 더 순한 저자극 올인원 샴푸', '15,900원', 'https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2366884463710346-50754a0d-106f-43dc-9e24-d6fdc0d55c90.jpg', '4', '99', '강아지 샴푸,코튼향,각질케어'),
                                ('쿤달 네이처 마일드 퍼퓸 애견 샴푸 화이트런더리향', '20,000원', 'https://thumbnail8.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/5993897575323274-1cb28351-0913-41cf-8b51-629aeb78673f.png', '4', '99', '강아지 샴푸'),
                                ('페토세라 강아지 저자극 보습 샴푸 히알루론산 세라마이드', '29,000원', 'https://thumbnail9.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/3839738099338034-0576dbf2-7283-446e-8236-8d62e7bcdf12.png', '4', '99', '강아지 샴푸, 진정,보습'),
                                ('하이포닉 저자극 샴푸 모든강아지용', '32,000원', 'https://thumbnail7.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/3122/4a5d7159233e85cb1163c7a2f504c00f97f41c179aa9481e0aa1a76e4ce4.jpg', '4', '99', '강아지 샴푸,유기농,천연'),
                                ('TS 써니 강아지 샴푸 베이비파우더향', '21,500원', 'https://thumbnail8.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2020/04/09/16/2/6c05be79-109a-4e2f-b2c3-d3f435a411bc.jpg', '4', '99', '강아지 샴푸'),
                                ('버블부들 스윗바나나 강아지 산책용 발 비누 100g + 거품망 세트', '10,000원', 'https://thumbnail7.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/328240382743592-05173d30-0f65-4303-a603-f4cf25f31753.png', '4', '99', '강아지 비누'),
                                ('프로버블리 강아지 비누 비타민 100g x 3p + 한방미용 100g x 2p', '15,000원', 'https://thumbnail10.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2020/07/03/16/1/16fcd531-2f9f-45e2-bb6d-aed6958d9779.jpg', '4', '99', '강아지 비누, 무향, 영양공급'),
                                ('동구밭 올바른 강아지 비누', '8,790원', 'https://thumbnail9.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/1146240244767169-60d6ad80-2e92-4327-ac97-4a609875607c.jpg', '4', '99', '강아지 비누'),
                                ('울지마마이펫 올인원 퇴치비누', '26,380원', 'https://thumbnail10.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/ac26/0821e69cdf6ac6e583a4c0c77354aba175f3f1fb9ba17c850c219dc4eb6f.jpg', '4', '99', '강아지 비누'),
                                ('도그스파 반려동물용 한방 허브솝 120g + 비누 거품망', '8,000원', 'https://thumbnail8.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2020/05/14/10/7/6f9e21c8-a6d3-4b8f-8035-72d7ac367c59.jpg', '4', '99', '강아지 비누,진정,보습'),
                                ('견체무해 정말순한 강아지 천연 비누 수제 샴푸바', '14,980원', 'https://thumbnail7.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/6d11/3a3940b716b75d02aa725387d4a59c7915bd38da884754dd7bea325f28b8.jpg', '4', '99', '강아지 비누,유기농,보습,습진,알러지,알레르기'),
                                ('동구밭 반려동물 저자극 발비누 시어버터', '13,000원', 'https://thumbnail10.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/8756/2d5489bef928255cc1474b6c09e066b90f092df8baf90b445bded9382c05.png', '4', '99', '강아지 비누,무향,진정,보습'),
                                ('애견목욕비누 100g x 2개 강아지비누 촉촉한보습 스위트레인', '9,800원', 'https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/3494/7e21d24781d7061b0544a016a639d050f37ab816479ef5815bf0ffe0b200.jpg', '4', '99', '강아지비누'),
                                ('반려견 천연목욕비누 각질 모근강화 펫케어 샴푸바 대용량 130g 2개', '9,900원', 'https://thumbnail7.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/dee1/4e3db2e28cc71dbe7939fe8bfe817726195ef4e1c0b5d2522fb71d1f35b4.jpg', '4', '99', '비누,약산성'),
                                ('강아지 개껌딱지', '9,900원', '', '4', '99', '비누,약산성성');
                                
UPDATE ShoppingItems
SET details = REPLACE(details, '비누,약산성성', '개껌')
WHERE name IN ('강아지 개껌딱지');

DELETE FROM ShoppingItems
WHERE name = '강아지 개껌딱지' AND many LIKE '%99%'
  

                                
                                    


CREATE TABLE Board (
    id NUMBER GENERATED ALWAYS AS IDENTITY,
    member_id INT,
    category VARCHAR2(50),
    title VARCHAR2(255),
    content VARCHAR2(255),
    png VARCHAR2(255),  -- Modify data type to VARCHAR2
    details VARCHAR2(255),
    views INT DEFAULT 0,
    PRIMARY KEY (id),
    FOREIGN KEY (member_id) REFERENCES Members3(id)
);

INSERT INTO Board (member_id, category, title, content, png, details, views) 
VALUES 
    ('aaa', '자유게시판', '시험용 작성글입니다', '기능 추가 예정입니다', '(img,jpg)', 'N, 장소 미정, 날짜 시간', 75);
    ('bbb', '자유게시판', '시험용 작성글입니다', '기능 추가 예정입니다', '(img,jpg)', 'N, 장소 미정, 날짜 시간', 42);
    ('ccc', '자유게시판', '시험용 작성글입니다', '기능 추가 예정입니다', '(img,jpg)', 'N, 장소 미정, 날짜 시간', 245);
    
DELETE FROM Board
WHERE member_id = 1 AND category = '자유게시판' AND title= '시험용 작성글입니다' AND content = '기능 추가 예정입니다' AND png= '(img,jpg)' AND details ='N, 장소 미정, 날짜 시간' AND views=75;


INSERT INTO Board (writer, category, title, content, png, details, views) 
VALUES 
    ('qqqq', '제품추천', '시험용 작성글입니다', '기능 추가 예정입니다', '(img,jpg)', 'N, 장소 미정, 날짜 시간', 45); 
    ('wwww', '제품추천', '시험용 작성글입니다', '기능 추가 예정입니다', '(img,jpg)', 'N, 장소 미정, 날짜 시간', 17);
    ('eeee', '제품추천', '시험용 작성글입니다', '기능 추가 예정입니다', '(img,jpg)', 'N, 장소 미정, 날짜 시간', 32);
    
INSERT INTO Board (writer, category, title, content, png, details, views) 
VALUES 
    ('xxx', '친구맺기', '시험용 작성글입니다', '기능 추가 예정입니다', '(img,jpg)', 'N, 장소 미정, 날짜 시간', 15);
    ('zzz', '친구맺기', '시험용 작성글입니다', '기능 추가 예정입니다', '(img,jpg)', 'N, 장소 미정, 날짜 시간', 45);
    ('yyy', '친구맺기', '시험용 작성글입니다', '기능 추가 예정입니다', '(img,jpg)', 'N, 장소 미정, 날짜 시간', 32);
    
INSERT INTO Board (member_id, category, title, content, png, details, views) 
VALUES
    ('aa1', '이벤트', '시험용 작성글입니다', '기능 추가 예정입니다', '(img,jpg)', 'N, 장소 미정, 날짜 시간', 76);
    ('bb1', '이벤트', '시험용 작성글입니다', '기능 추가 예정입니다', '(img,jpg)', 'N, 장소 미정, 날짜 시간', 12);
    ('cc1', '이벤트', '시험용 작성글입니다', '기능 추가 예정입니다', '(img,jpg)', 'N, 장소 미정, 날짜 시간', 144);

UPDATE Board
SET title = REPLACE(title, '시험용 작성글입니다', '테스트가 완료되었습니다')
WHERE member_id = 10;
