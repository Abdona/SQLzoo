/*tutorial 0 */
SELECT population FROM world
  WHERE name = 'Germany'

  SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

  SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

  /*tutorial 1*/

  SELECT name FROM world
  WHERE name LIKE 'Y%'

  SELECT name FROM world
  WHERE name LIKE '%Y'

  SELECT name FROM world
  WHERE name LIKE '%x%'

  SELECT name FROM world
  WHERE name LIKE '%land'

  SELECT name FROM world
  WHERE name LIKE 'C%ia';

  SELECT name FROM world
  WHERE name LIKE '%oo%'

  SELECT name FROM world
  WHERE name LIKE '%a%%a%%a%';

  SELECT name FROM world
  WHERE name LIKE '_t%'
  ORDER BY name;

  SELECT name FROM world
 WHERE name LIKE '%o__o%';

  
  SELECT name FROM world
  WHERE name LIKE '____';

  SELECT name
  FROM world
 WHERE name = capital ;

 SELECT name
  FROM world
 WHERE capital = concat(name, ' City')

 SELECT capital, name
FROM world
WHERE capital LIKE concat('%',name,'%');  

SELECT capital, name
FROM world
WHERE capital LIKE concat(name,'_','%');

SELECT name,  REPLACE( capital, name, '')AS ext
FROM world
WHERE capital LIKE concat(name,'_','%');

  /*tutorial 2 */
  SELECT name, continent, population FROM world;

  SELECT name
  FROM world
 WHERE population >= 200000000;

  SELECT name,gdp/population FROM world WHERE population>200000000 

  SELECT name,population/1000000 from world WHERE continent='South America';

  SELECT name,population FROM world WHERE name IN ('France','Germany','Italy');

  SELECT name FROM world WHERE name LIKE '%United%';

  SELECT name,population,area FROM world WHERE area>=3000000 OR population >=250000000;

  SELECT name,population,area FROM world WHERE area>=3000000 XOR population >=250000000;

  SELECT name,ROUND(population/1000000,2) ,ROUND(GDP/1000000000,2) FROM world WHERE continent='South America';

  SELECT name,ROUND(GDP/population,-3) FROM world WHERE gdp>=1000000000000;

  SELECT name,   
       capital
  FROM world
 WHERE LENGTH(name)=LENGTH(capital);

 SELECT name,capital
FROM world WHERE LEFT(name,1)=LEFT(capital,1) AND /*LEFT return the nth letter */
 name<>capital;

SELECT name
   FROM world
WHERE name LIKE '%o%' and name LIKE '%a%' and name LIKE '%i%' and name LIKE '%u%' and name LIKE '%e%' 
  AND name NOT LIKE '% %';

/*Tutorial 4*/
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

SELECT name FROM world
  WHERE continent = 'Europe' AND
  gdp/population >
     (SELECT gdp/population FROM world
      WHERE name='United Kingdom') 

      SELECT name,continent FROM world
WHERE continent =
(SELECT continent FROM world WHERE name = 'Argentina')
OR continent=
(SELECT continent FROM world WHERE name = 'Australia') ORDER BY name

SELECT name FROM world
WHERE population >
(SELECT population FROM world WHERE name = 'Canada')
AND population<
(SELECT population FROM world WHERE name = 'Poland') ORDER BY name

SELECT name,CONCAT(ROUND(100*population/(SELECT population FROM world where name='Germany'),0),'%') AS percentage FROM world
WHERE continent ='Europe'

SELECT name
  FROM world
 WHERE gdp > ALL(SELECT gdp
                           FROM world
WHERE continent='Europe' AND gdp > 0
                          )

                          

SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND population>0)


SELECT continent,name FROM world x
WHERE name<=ALL(SELECT name FROM world y WHERE x.continent=y.continent
 ORDER BY name
) ORDER BY continent

SELECT name,continent,population FROM world x
where name = ALL(SELECT continent FROM world y
WHERE x.continent=y.continent AND y.population >=25000000 )

SELECT name,continent FROM world x
WHERE population >= ALL(SELECT 3*population FROM world y
WHERE x.continent = y.continent  AND x.name <> y.name)

/*Tutorial 5*/
SELECT SUM(population)
FROM world

SELECT DISTINCT(continent)
FROM world

SELECT SUM(gdp)
FROM world
WHERE continent='Africa'

SELECT COUNT(name)
FROM world
WHERE area>=1000000

SELECT SUM(population)
FROM world
WHERE name = 'Estonia' OR name='Latvia' OR name = 'Lithuania'

SELECT continent,COUNT(name)
FROM world
GROUP BY continent

SELECT continent,COUNT(name)
FROM world
WHERE population >=10000000
GROUP BY continent

SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population)>= 100000000
