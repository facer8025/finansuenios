import { pool } from '../db/db.js'

export class UserModel {
  static async getAll () {
    const users = pool.query(
      'SELECT name, lastname, email FROM users'
    )
    return users.rows
  }

  static async getById ({ id }) {
    const [user] = pool.query(
      'SELECT name, lastname, email FROM users WHERE id = $1', [id]
    )

    if (user.length === 0) return []

    return user.rows
  }

  static async create ({ input }) {
    const { name, lastname, email } = input

    try {
      await pool.query(
        'INSERT INTO users (name, lastname, email) VALUES ($1, $2, $3)', [name, lastname, email]
      )
    } catch (error) {
      // throw new Error('Error al crear nuevo usuairo')
      throw new Error('Error al crear nuevo usuairo: ' + error)
    }

    const newUser = await pool.query(
      'SELECT name, lastname, email FROM users WHERE id = (SELECT MAX(id) FROM users)'
    )

    if (newUser.length === 0) return []

    return newUser.rows
  }
}
