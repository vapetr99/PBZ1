
-- 9
SELECT detail_id FROM detail_number
JOIN provider ON detail_number.provider_id = provider.id_pr
WHERE provider.city = 'Лондон';

-- 34
SELECT detail_id FROM detail_number
JOIN provider ON detail_number.provider_id = provider.id_pr
JOIN project ON detail_number.project_id = project.id_pj
WHERE provider.city = 'Лондон' OR project.city = 'Лондон';

-- 6
SELECT id_pr, id_det, id_pj FROM provider, detail, project
WHERE provider.city = detail.city AND provider.city = project.city AND detail.city = project.city;

-- 12
SELECT detail_id FROM detail_number
JOIN provider ON detail_number.provider_id = provider.id_pr
JOIN project ON detail_number.project_id = project.id_pj
WHERE provider.city = project.city;

-- 16
SELECT SUM(S) FROM detail_number
WHERE detail_id = 'Д1' AND provider_id = 'П1';

-- 24
SELECT DISTINCT pr.id_pr FROM provider AS pr
WHERE pr.status < (
  SELECT p1.status
  FROM provider AS p1
  WHERE p1.id_pr = 'П1'
);

-- 28
SELECT DISTINCT project_id FROM detail_number
JOIN provider ON detail_number.provider_id = provider.id_pr
JOIN detail ON detail_number.detail_id = detail.id_det
WHERE provider.city = 'Лондон' AND detail.id_det <> 'Красный';

-- 20
SELECT DISTINCT colour FROM detail
JOIN detail_number ON detail_number.detail_id = detail.id_det
WHERE detail_number.provider_id = 'П1';

-- 10
SELECT detail_id FROM detail_number
JOIN provider ON detail_number.provider_id = provider.id_pr
JOIN project ON detail_number.project_id = project.id_pj
WHERE provider.city = 'Лондон' AND project.city = 'Лондон';

-- 30
SELECT detail_id FROM detail_number
JOIN project ON detail_number.project_id = project.id_pj
WHERE project.city = 'Лондон';