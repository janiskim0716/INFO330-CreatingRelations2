-- Create a new table with split abilities.
CREATE TABLE pokemon_abilities AS
SELECT pokedex_number, name, abilities, 
    trim(value) AS split_ability
FROM imported_pokemon_data,
  json_each('["' || replace(abilities, ',', '","') || '"]')
WHERE abilities <> '';

-- Make the table more readable.
update pokemon_abilities
SET split_ability = replace(split_ability, ',' ,'');

update pokemon_abilities 
SET split_ability = replace(split_ability, "", '');

update pokemon_abilities
SET split_ability = replace(split_ability, '[', '');

update pokemon_abilities
SET split_ability = replace(split_ability, ']', '');


-- Create a new table with split abilities without 'abilities'.
CREATE TABLE OneNF AS
SELECT IPD.*, PA.split_ability
FROM imported_pokemon_data AS IPD
JOIN pokemon_abilities AS PA
ON IPD.pokedex_number = PA.pokedex_number;

ALTER TABLE OneNF DROP COLUMN abilities;