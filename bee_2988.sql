--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2988

CREATE TABLE teams (
    id integer PRIMARY KEY,
    name varchar(50)
);

-- GRANT SELECT ON teams TO sql_user;

CREATE TABLE matches  (
    id integer PRIMARY KEY,
    team_1 integer,
    team_2 integer,
    team_1_goals integer,
    team_2_goals integer,
    FOREIGN KEY (team_1) REFERENCES teams(id),
    FOREIGN KEY (team_2) REFERENCES teams(id)
);

insert into teams
    (id, name)
values
    (1,'CEARA'),
    (2,'FORTALEZA'),
    (3,'GUARANY DE SOBRAL'),
    (4,'FLORESTA');

insert into  matches
    (id, team_1, team_2, team_1_goals, team_2_goals)
values
    (1,4,1,0,4),
    (2,3,2,0,1),
    (3,1,3,3,0),
    (4,3,4,0,1),
    (5,1,2,0,0),
    (6,2,4,2,1);

/* Execute this query to drop the table */
-- DROP TABLE matches CASCADE;

SELECT teams.name, 
        (SELECT COUNT(1)
        FROM matches
        WHERE matches.team_1 = teams.id OR matches.team_2 = teams.id) AS matches,
        (SELECT COUNT(1)
        FROM matches
        WHERE (matches.team_1 = teams.id AND matches.team_1_goals>matches.team_2_goals) OR (matches.team_2 = teams.id AND matches.team_2_goals>team_1_goals)) AS victories,
        (SELECT COUNT(1)
        FROM matches
        WHERE (matches.team_1 = teams.id AND matches.team_1_goals<matches.team_2_goals) OR (matches.team_2 = teams.id AND matches.team_2_goals<team_1_goals)) AS defeats,
        (SELECT COUNT(1)
        FROM matches
        WHERE (matches.team_1 = teams.id AND matches.team_1_goals=matches.team_2_goals) OR (matches.team_2 = teams.id AND matches.team_2_goals=team_1_goals)) AS draws,
        (
        (SELECT COUNT(1)
        FROM matches
        WHERE (matches.team_1 = teams.id AND matches.team_1_goals>matches.team_2_goals) OR (matches.team_2 = teams.id AND matches.team_2_goals>team_1_goals))*3 +
        (SELECT COUNT(1)
        FROM matches
        WHERE (matches.team_1 = teams.id AND matches.team_1_goals=matches.team_2_goals) OR (matches.team_2 = teams.id AND matches.team_2_goals=team_1_goals))
        ) AS score
FROM teams 
ORDER BY score DESC;