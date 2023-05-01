-- Create a table that joines OneNF table and Ability table.
CREATE TABLE Link_Ability AS
SELECT * FROM OneNF
JOIN Ability ON Ability.abilities_name = OneNF.split_ability;
--
CREATE TABLE Pokemon_Ability
AS SELECT abilityid, pokedex_number FROM Link_Ability;



-- Create a table that joines OneNF table and Type table.
CREATE TABLE Link_Type AS
SELECT * FROM OneNF
JOIN Type ON Type.type_name = OneNF.type2;
--
CREATE TABLE Pokemon_Type
AS SELECT typeid, pokedex_number FROM Link_Type;



-- Create the Against table.
CREATE TABLE Against AS
SELECT DISTINCT pokedex_number, type1, type2, against_bug, against_dark, against_dragon,
against_electric, against_fairy, against_fight, against_fire, against_flying, against_ghost,
against_grass, against_ground, against_ice, against_normal, against_poison, against_psychic,
against_rock, against_steel, against_water
FROM OneNF;
-- Add type 1 and type 2.
ALTER TABLE Against ADD COLUMN type1_Id INTEGER;
ALTER TABLE Against ADD COLUMN type2_Id INTEGER;
UPDATE Against SET type1_Id = (
  SELECT Link_Type.typeid FROM Link_Type WHERE Link_Type.type1 = Against.type1
);
UPDATE Against SET type2_Id = (
  SELECT Link_Type.typeid FROM Link_Type WHERE Link_Type.type2 = Against.type2
);