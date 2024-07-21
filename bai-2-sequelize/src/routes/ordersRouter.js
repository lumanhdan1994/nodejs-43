import express from 'express'
import { getOrders, getOrdersByUser, getOrdersByFood, onOrder } from '../controllers/ordersController.js'

const ordersRouter = express.Router()

ordersRouter.use('/get-all-orders', getOrders)
ordersRouter.use('/get-orders-by-user/:user_id', getOrdersByUser)
ordersRouter.use('/get-orders-by-food/:food_id', getOrdersByFood)
ordersRouter.post('/make-orders', onOrder)

export default ordersRouter
