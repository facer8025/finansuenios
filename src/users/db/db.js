import pg from 'pg'

export const pool = new pg.Pool({
  host: 'localhost',
  port: 5432,
  user: 'facer',
  password: 'desarrollo',
  database: 'db_app'
})
