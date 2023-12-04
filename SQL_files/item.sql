-- 유저들이 가장 많이 산 방어템 3개 추천
SELECT i.id, i.name,  i.category, COUNT(pi.item_id) AS 구매횟수
FROM item i
LEFT JOIN purchased_item pi ON i.id = pi.item_id
WHERE i.category = '방어'
GROUP BY i.id
ORDER BY 구매횟수 DESC
LIMIT 3;

-- 유저들이 가장 많이 산 공격템 3개 추천
SELECT i.id, i.name,  i.category, COUNT(pi.item_id) AS 구매횟수
FROM item i
LEFT JOIN purchased_item pi ON i.id = pi.item_id
WHERE i.category = '공격'
GROUP BY i.id
ORDER BY 구매횟수 DESC
LIMIT 3;