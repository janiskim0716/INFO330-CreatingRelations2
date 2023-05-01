-- Create the Pokemon table.
CREATE TABLE Pokemon(
pokeid INTEGER PRIMARY KEY AUTOINCREMENT,
pokedex_number,
name, 
classfication ,
attack NUMERIC, 
base_egg_steps NUMERIC,
base_happiness NUMERIC,
base_total NUMERIC,
capture_rate NUMERIC,
defense NUMERIC,
experience_growth NUMERIC,
height_m NUMERIC,
hp NUMERIC,
percentage_male NUMERIC,
sp_attack NUMERIC,
sp_defense NUMERIC,
speed NUMERIC,
weight_kg NUMERIC,
generation NUMERIC,
is_legendary NUMERIC);
-- Insert valuses from 1NF to the Pokemon table.
INSERT INTO Pokemon(pokedex_number, name, classfication, attack, base_egg_steps, base_happiness,
base_total, capture_rate, defense, experience_growth, height_m, hp, percentage_male,
sp_attack, sp_defense, speed, weight_kg, generation, is_legendary)
SELECT
DISTINCT pokedex_number, name, classfication, attack, base_egg_steps, base_happiness,
base_total, capture_rate, defense, experience_growth, height_m, hp, percentage_male,
sp_attack, sp_defense, speed, weight_kg, generation, is_legendary
FROM OneNF;


-- Create Ability table.
CREATE TABLE Ability(
abilityid INTEGER PRIMARY KEY AUTOINCREMENT,
abilities_name);
-- Insert values from 1NF to the Ability table.
INSERT INTO Ability(
 abilities_name)
SELECT DISTINCT split_ability
FROM OneNF;


-- Create Type table.
CREATE TABLE Type (
typeid INTEGER PRIMARY KEY AUTOINCREMENT,
type_name);
-- Insert values from 1NF to the Type table.
INSERT INTO Type(
type_name)
SELECT DISTINCT type2
FROM OneNF;


-- Create Against_type table.
CREATE TABLE Against_type AS
SELECT DISTINCT pokedex_number, against_bug,
against_dark, against_dragon,
against_electric, against_fairy,
against_fight, against_fire,
against_flying, against_ghost,
against_grass, against_ground,
against_ice, against_normal,
against_poison, against_psychic,
against_rock, against_steel,
against_water
FROM OneNF;