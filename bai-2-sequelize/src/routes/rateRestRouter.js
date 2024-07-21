import express from 'express'
import { getRateRestaurants, getRateRestaurantsByUser, onRateRest } from '../controllers/rateRestController.js'

const rateRestRouter = express.Router()

rateRestRouter.get('/get-rate-restaurants/:res_id', getRateRestaurants)
rateRestRouter.get('/get-rate-restaurants-by-user/:user_id', getRateRestaurantsByUser)

rateRestRouter.post('/rate', onRateRest)

export default rateRestRouter
