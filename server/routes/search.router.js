const express = require('express');
const pool = require('../modules/pool');
const axios = require('axios');
const router = express.Router();

router.get('/:searchString', (req,res)=>{
    console.log('my giphy key', process.env.GIPHY_API_KEY);
   let key = process.env.GIPHY_API_KEY;
    axios.get(`http://api.giphy.com/v1/gifs/random?tag=${req.params.searchString}&api_key=${key}`)
        .then((response)=>{
            console.log('response from giphy search on server', response.data);
            res.send(response.data)
        }).catch((error)=>{
            console.log(error);
            
        })

    })

module.exports = router;
