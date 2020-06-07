--DROP TABLE visits IF EXISTS;

CREATE TABLE IF NOT EXISTS visits (
  id          INTEGER IDENTITY PRIMARY KEY,
  pet_id      INTEGER NOT NULL,
  visit_date  DATE,
  description VARCHAR(8192)
);

CREATE INDEX IF NOT EXISTS visits_pet_id ON visits (pet_id);
