const express = require('express')
const app = express()
const port = 1234

app.get('/', (request, response) => {
  response.send('Hello from Express!')
})

app.listen(port, (err) => {
  if (err) {
    return console.log('something bad happened', err)
  }

  console.log(`This server is listening on ${port}`)
})