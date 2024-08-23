import { Router } from 'express'
import { UserController } from '../users/controller/UserController.js'

export const createUserRouter = ({ userModel }) => {
  const userRouter = Router()

  const userController = new UserController({ userModel })

  userRouter.get('/', userController.getAll)
  userRouter.get('/:id', userController.getById)

  userRouter.post('/', userController.create)

  return userRouter
}
