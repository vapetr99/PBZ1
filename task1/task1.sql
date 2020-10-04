SELECT * FROM teachers;

SELECT * FROM studentgroup WHERE specialty = 'ЭВМ';

SELECT DISTINCT personal_num, lecture_hall FROM teacher_in_group WHERE code_numsub = '18П';

SELECT DISTINCT subjects.code_numsub,subjects.name_subject FROM subjects
INNER JOIN teacher_in_group ON teacher_in_group.code_numsub = subjects.code_numsub
INNER JOIN teachers ON teacher_in_group.personal_num = teachers.personal_num
WHERE teachers.surname = 'Костин';

SELECT DISTINCT teacher_in_group.code_numgroup FROM teacher_in_group
INNER JOIN teachers ON teacher_in_group.personal_num = teachers.personal_num
WHERE teachers.surname = 'Фролов';

SELECT * FROM subjects WHERE specialty = 'АСОИ';

SELECT * FROM teachers WHERE specialty like '%АСОИ%';

SELECT DISTINCT teachers.surname FROM teachers
INNER JOIN teacher_in_group ON teachers.personal_num = teacher_in_group.personal_num
WHERE teacher_in_group.lecture_hall = '210';

SELECT DISTINCT subjects.name_subject, studentgroup.name_group FROM teacher_in_group
INNER JOIN studentgroup ON studentgroup.code_numgroup = teacher_in_group.code_numgroup
INNER JOIN subjects ON subjects.code_numsub = teacher_in_group.code_numsub
WHERE teacher_in_group.lecture_hall >=100 AND teacher_in_group.lecture_hall <=200;


SELECT a.code_numgroup AS code_numgroup_1, b.code_numgroup AS code_numgroup_2
FROM studentgroup a, studentgroup b WHERE a.name_group > b.name_group
AND a.specialty = b.specialty;

SELECT SUM(num_human) FROM studentgroup WHERE specialty='ЭВМ';

SELECT personal_num FROM teachers WHERE specialty like '%ЭВМ%';

SELECT DISTINCT code_numsub FROM teacher_in_group;

SELECT surname FROM teachers t
    JOIN teacher_in_group tg ON t.personal_num = tg.personal_num
    WHERE code_numsub IN (
        SELECT code_numsub FROM teacher_in_group
        WHERE personal_num IN (
	    SELECT personal_num FROM teacher_in_group
	    WHERE code_numsub = '14П'
	)
    );

SELECT DISTINCT subjects.* FROM subjects
INNER JOIN teacher_in_group ON subjects.code_numsub = teacher_in_group.code_numsub
WHERE teacher_in_group.personal_num NOT IN ('221Л');

SELECT DISTINCT subjects.* FROM subjects
INNER JOIN teacher_in_group ON subjects.code_numsub = teacher_in_group.code_numsub
INNER JOIN studentgroup ON teacher_in_group.code_numgroup = studentgroup.code_numgroup
WHERE
studentgroup.name_group<>'М-6';

SELECT DISTINCT teachers.* FROM teachers
INNER JOIN teacher_in_group ON teachers.personal_num = teacher_in_group.personal_num
WHERE (teacher_in_group.code_numgroup='3Г' OR teacher_in_group.code_numgroup='8Г') AND teachers.positio = 'Доцент';

SELECT DISTINCT teacher_in_group.code_numsub, teacher_in_group.personal_num, teacher_in_group.code_numgroup FROM teacher_in_group
INNER JOIN teachers ON teacher_in_group.personal_num = teachers.personal_num
WHERE teachers.department='ЭВМ' AND teachers.specialty LIKE '%АСОИ%';

SELECT DISTINCT studentgroup.code_numgroup FROM studentgroup
INNER JOIN teacher_in_group ON teacher_in_group.code_numgroup = studentgroup.code_numgroup
INNER JOIN teachers ON teacher_in_group.personal_num = teachers.personal_num
WHERE teachers.specialty LIKE studentgroup.specialty;

SELECT DISTINCT teachers.personal_num FROM teachers
INNER JOIN teacher_in_group ON teacher_in_group.personal_num = teachers.personal_num
INNER JOIN studentgroup ON teacher_in_group.code_numgroup = studentgroup.code_numgroup
WHERE teachers.department='ЭВМ' AND teachers.specialty=studentgroup.specialty;

SELECT DISTINCT studentgroup.specialty FROM studentgroup
INNER JOIN teacher_in_group ON teacher_in_group.code_numgroup = studentgroup.code_numgroup
INNER JOIN teachers ON teacher_in_group.personal_num = teachers.personal_num
WHERE teachers.department='АСУ';

SELECT DISTINCT subjects.code_numsub FROM subjects
INNER JOIN teacher_in_group ON subjects.code_numsub = teacher_in_group.code_numsub
INNER JOIN studentgroup ON teacher_in_group.code_numgroup = studentgroup.code_numgroup
WHERE studentgroup.name_group='АС-8';


SELECT DISTINCT teacher_in_group.code_numgroup
FROM teacher_in_group
WHERE teacher_in_group.code_numsub IN (
  SELECT DISTINCT teacher_in_group.code_numsub
  FROM teacher_in_group
  JOIN studentgroup
    ON studentgroup.code_numgroup = teacher_in_group.code_numgroup
  WHERE studentgroup.name_group = 'АС-8'
);


SELECT DISTINCT studentgroup.code_numgroup
FROM studentgroup
WHERE NOT studentgroup.code_numgroup IN (
  SELECT DISTINCT teacher_in_group.code_numgroup
  FROM teacher_in_group
  WHERE teacher_in_group.code_numsub IN (
    SELECT DISTINCT teacher_in_group.code_numsub
    FROM teacher_in_group
    JOIN studentgroup
      ON studentgroup.code_numgroup = teacher_in_group.code_numgroup
    WHERE studentgroup.name_group = 'АС-8'
  )
);


SELECT DISTINCT studentgroup.code_numgroup
FROM studentgroup
WHERE NOT studentgroup.code_numgroup IN (
  SELECT DISTINCT teacher_in_group.code_numgroup
  FROM teacher_in_group
  WHERE teacher_in_group.code_numsub IN (
    SELECT DISTINCT teacher_in_group.code_numsub
    FROM teacher_in_group
    JOIN teachers
      ON teachers.personal_num = teacher_in_group.personal_num
    WHERE teachers.personal_num = '430Л'
  )
);

SELECT DISTINCT teacher_in_group.personal_num FROM teacher_in_group
INNER JOIN studentgroup ON studentgroup.code_numgroup = teacher_in_group.code_numgroup
WHERE studentgroup.name_group = 'Э-15' AND  teacher_in_group.personal_num  NOT IN (
  SELECT teacher_in_group.personal_num FROM teacher_in_group WHERE teacher_in_group.code_numsub = '12П'
);