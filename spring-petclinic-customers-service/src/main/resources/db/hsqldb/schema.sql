--DROP TABLE pets IF EXISTS;
--DROP TABLE types IF EXISTS;
--DROP TABLE owners IF EXISTS;

CREATE TABLE IF NOT EXISTS types (
  id   INTEGER IDENTITY PRIMARY KEY,
  name VARCHAR(80)
);
CREATE INDEX IF NOT EXISTS types_name ON types (name);

CREATE TABLE IF NOT EXISTS owners (
  id         INTEGER IDENTITY PRIMARY KEY,
  first_name VARCHAR(30),
  last_name  VARCHAR(30),
  address    VARCHAR(255),
  city       VARCHAR(80),
  telephone  VARCHAR(20)
);
CREATE INDEX IF NOT EXISTS owners_last_name ON owners (last_name);

CREATE TABLE IF NOT EXISTS pets (
  id         INTEGER IDENTITY PRIMARY KEY,
  name       VARCHAR(30),
  birth_date DATE,
  type_id    INTEGER NOT NULL,
  owner_id   INTEGER NOT NULL
);
ALTER TABLE pets ADD CONSTRAINT IF NOT EXISTS fk_pets_owners FOREIGN KEY (owner_id) REFERENCES owners (id);
ALTER TABLE pets ADD CONSTRAINT IF NOT EXISTS fk_pets_types FOREIGN KEY (type_id) REFERENCES types (id);
CREATE INDEX IF NOT EXISTS pets_name ON pets (name);
