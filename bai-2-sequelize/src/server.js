import express from 'express'
import cors from 'cors'
import rootRouter from './routes/rootRouter.js'

const app = express()
const port = 8080

app.use(express.json())

app.use(cors({
    origin: [`http://localhost:${port}`]
}))

app.listen(port)

app.use(rootRouter)
