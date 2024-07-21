import { where } from "sequelize"
import { standardizedResponse } from "../configs/standardizedResponse.js"
import sequelize from "../models/connect.js"
import initModels from "../models/init-models.js"

const { like_res } = initModels(sequelize)

const getLikeRestaurants = async (req, res) => {
    const { res_id } = req.params
    let data = await like_res.findAll({
        where: {
            res_id
        },
    })
    standardizedResponse({data}, "success", 200, res)
}

const getLikeRestaurantsByUser = async (req, res) => {
    const { user_id } = req.params
    let data = await like_res.findAll({
        where: {
            user_id
        },
    })
    standardizedResponse({data}, "success", 200, res)
}

const onLikeRest = async (req, res) => {
    const { res_id, user_id, amount } = req.body
    const isRestChecked = await like_res.findAll({
        where: {
            res_id,
            user_id
        }
    })

    if (isRestChecked?.length) {
        standardizedResponse({}, "Thank you, but you have already liked this restaurant.", 409, res)
        return
    }

    await like_res.create({
        amount,
        user_id,
        res_id,
        date_like: new Date()
    })
    standardizedResponse({ data: true }, "success", 201, res)
}

const onUnlikeRest = async (req, res) => {
    const { res_id, user_id } = req.body
    const isRestChecked = await like_res.findAll({
        where: {
            res_id,
            user_id
        }
    })

    if (!isRestChecked?.length) {
        standardizedResponse({}, "Thank you, but you have already un-liked this restaurant.", 409, res)
        return
    }

    await like_res.destroy({
        where: {
            user_id,
            res_id,
        }
    })
    standardizedResponse({ data: true }, "success", 201, res)
}

export {
    getLikeRestaurants,
    getLikeRestaurantsByUser,
    onLikeRest,
    onUnlikeRest,
}