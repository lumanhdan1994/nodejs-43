import express from 'express'
import rateRestRouter from './rateRestRouter.js'
import likeRestRouter from './likeRestRouter.js'
import ordersRouter from './ordersRouter.js'

const rootRouter = express.Router()

rootRouter.use('/rate-rest', rateRestRouter)
rootRouter.use('/like-rest', likeRestRouter)
rootRouter.use('/orders', ordersRouter)

export default rootRouter
