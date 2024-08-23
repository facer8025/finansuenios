import express, { json } from 'express'
import { createUserRouter } from './src/routes/createUserRouter.js'
import { corsMiddleware } from './src/middleware/userMiddleware.js'

export const createApp = ({ userModel }) => {
  const app = express()
  app.use(json())
  app.use(corsMiddleware())
  app.disable('x-powered-by')

  app.use('/users', createUserRouter({ userModel }))

  const PORT = process.env.PORT ?? 3000

  app.listen(PORT, () => {
    console.log(`Server listening on port http://localhost:${PORT}`)
  })
}
