import { standardizedResponse } from "../configs/standardizedResponse.js"
import sequelize from "../models/connect.js"
import initModels from "../models/init-models.js"

const { orders } = initModels(sequelize)

const getOrders = async (req, res) => {
    const data = await orders.findAll()
    standardizedResponse({data}, "success", 200, res)
}

const getOrdersByUser = async (req, res) => {
    const { user_id } = req.params
    const data = await orders.findAll({
        where: {
            user_id
        }
    })
    standardizedResponse({data}, "success", 200, res)
}

const getOrdersByFood = async (req, res) => {
    const { food_id } = req.params
    const data = await orders.findAll({
        where: {
            food_id
        }
    })
    standardizedResponse({data}, "success", 200, res)
}

const onOrder = async (req, res) => {
    const { food_id, user_id, amount } = req.body
    const isOrderChecked = await orders.findOne({
        where: {
            food_id,
            user_id
        }
    })

    if (isOrderChecked) {
        await orders.update(
            { amount: isOrderChecked.amount + 1},
            {
                where: {
                    user_id,
                    food_id,
                }
            }
        )
        standardizedResponse({ data: true }, "success", 201, res)
        return
    }

    await orders.create({
        amount,
        user_id,
        food_id,
        order_code: ''
    })
    standardizedResponse({ data: true }, "success", 201, res)
}

export {
    getOrders,
    getOrdersByUser,
    getOrdersByFood,
    onOrder
}