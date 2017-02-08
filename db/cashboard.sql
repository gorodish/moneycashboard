DROP TABLE merchants CASCADE;
DROP TABLE transactions CASCADE;

CREATE TABLE merchants (
  id SERIAL4 primary key,
  name VARCHAR(255) not null,
  linkref INT4
);

CREATE TABLE transactions (
  id SERIAL4 primary key,
  merchant VARCHAR(255) not null,
  amount NUMERIC not null,
  tag VARCHAR(255) not null,
  tran_date date
);