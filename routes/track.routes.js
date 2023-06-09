const Router = require('express')
const router = new Router()
const trackController = require('../controllers/track.controller')

router.get('/tracks', trackController.getAllTracks)
router.get('/tracks/:id', trackController.getTrack)

module.exports = router