import z from 'zod'

const userSchema = z.object({
  name: z.string({
    invalid_type_error: 'User name must be a string.',
    required_error: 'User name is required.'
  }),
  lastname: z.string({
    invalid_type_error: 'User name must be a string.',
    required_error: 'User name is required.'
  })
})

// Función que validad todos los datos de usuario
export function validateUser (input) {
  return userSchema.safeParse(input)
}

// Función que valida parte de los datos de usuario
export function validatePartialUser (input) {
  return userSchema.partial().safeParse(input)
}
