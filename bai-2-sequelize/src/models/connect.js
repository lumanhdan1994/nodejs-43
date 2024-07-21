import { Sequelize } from 'sequelize'

const { DB_DATABASE, DB_USER, DB_PW, DB_HOST, DB_PORT, DB_DIALECT } = process.env
const sequelize = new Sequelize({
    database: DB_DATABASE,
    username: DB_USER,
    password: DB_PW,
    host: DB_HOST,
    port: DB_PORT,
    dialect: DB_DIALECT,
})

export default sequelize
// yarn sequelize-auto -h localhost -d bai_1 -u root -x 123456 -p 3307 --dialect mysql -o src/models -l esm
