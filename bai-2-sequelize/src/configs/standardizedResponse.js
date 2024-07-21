export const standardizedResponse = (data, message, status, response) => {
    const resData = {
        status,
        message,
        content: data.data,
        date: new Date(),
    }
    if (data?.totalPage && data?.totalCount) {
        resData.totalPage = data?.totalPage
        resData.totalCount = data?.totalCount
    }
    response.status(status).json(resData)
}
