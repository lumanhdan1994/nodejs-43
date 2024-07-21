import { standardizedResponse } from "../configs/standardizedResponse.js"
import sequelize from "../models/connect.js"
import initModels from "../models/init-models.js"

const { rate_res } = initModels(sequelize)

const getRateRestaurants = async (req, res) => {
    const { res_id } = req.params
    let data = await rate_res.findAll({
        where: {
            res_id
        },
    })
    standardizedResponse({data}, "success", 200, res)
}

const getRateRestaurantsByUser = async (req, res) => {
    const { user_id } = req.params
    let data = await rate_res.findAll({
        where: {
            user_id
        },
    })
    standardizedResponse({data}, "success", 200, res)
}

const onRateRest = async (req, res) => {
    const { res_id, user_id, amount } = req.body
    const isRestChecked = await rate_res.findAll({
        where: {
            res_id,
            user_id
        }
    })

    if (isRestChecked?.length) {
        standardizedResponse({}, "Thank you, but you have already rated this restaurant.", 409, res)
        return
    }

    await rate_res.create({
        amount,
        user_id,
        res_id,
        date_rate: new Date()
    })
    standardizedResponse({ data: true }, "success", 201, res)
}

export {
    getRateRestaurants,
    getRateRestaurantsByUser,
    onRateRest
}