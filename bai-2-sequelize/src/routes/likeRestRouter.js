import express from 'express'
import { getLikeRestaurants, getLikeRestaurantsByUser, onLikeRest, onUnlikeRest } from '../controllers/likeRestController.js'

const likeRestRouter = express.Router()

likeRestRouter.get('/get-like-restaurants/:res_id', getLikeRestaurants)
likeRestRouter.get('/get-like-restaurants-by-user/:user_id', getLikeRestaurantsByUser)

likeRestRouter.post('/like', onLikeRest)
likeRestRouter.post('/un-like', onUnlikeRest)

export default likeRestRouter
