import { validateUser } from '../schemas/userSchema.js'

export class UserController {
  constructor({ userModel }) {
    this.userModel = userModel
  }

  getAll = async (req, res) => {
    const users = await this.userModel.getAll()
    res.json(users)
  }

  getById = async (req, res) => {
    const { id } = req.params
    const user = await this.userModel.getById({ id })
    res.json(user)
  }

  create = async (req, res) => {
    const result = validateUser(req.body)

    if (!result.success) {
      return res.status(400).json({ error: JSON.parse(result.error.message) })
    }

    const newUser = await this.userModel.create({ input: result.data })
    res.status(201).json(newUser)
  }
}
